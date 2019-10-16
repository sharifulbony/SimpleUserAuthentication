package com.sharifulbony.tokenlogin.user;

import java.util.ArrayList;

import com.sharifulbony.tokenlogin.JWT.JwtTokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.firewall.RequestRejectedException;
import org.springframework.stereotype.Service;


@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

	@Autowired
	private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private PasswordEncoder bcryptEncoder;

    @Override
    public UserDetails loadUserByUsername(String userInitials) throws UsernameNotFoundException {
        UserEntity user = userRepository.findByEmail(userInitials);

        if(user!=null){
			return new User(user.getEmail(), user.getPassword(), new ArrayList<>());
		}else{
			UserEntity user2 = userRepository.findByPersonalCode(userInitials);
			if(user2!=null){
				return new User(user2.getEmail(), user2.getPassword(), new ArrayList<>());
			}else{
				throw new UsernameNotFoundException("User not found with initial: " + userInitials);
			}

		}

    }


    public String parseUserNameFromToken(String requestTokenHeader){
		String username = null;
		String jwtToken = null;
		if (requestTokenHeader != null ) {
			jwtToken = requestTokenHeader.substring(7);
			try {
				username = jwtTokenUtil.getUsernameFromToken(jwtToken);
			} catch (IllegalArgumentException e) {
				throw  new RequestRejectedException("Unable to get JWT Token");
			}
		} else {
			throw  new RequestRejectedException(" Invalid Token");
		}
		return username;
	}



	public UserEntity loadUserByInitials(String userInitials) throws UsernameNotFoundException {
		UserEntity user = userRepository.findByEmail(userInitials);

		if(user!=null){
			return user;
		}else{
			UserEntity user2 = userRepository.findByPersonalCode(userInitials);
			if(user2!=null){
				return user2;
			}else{
				throw new UsernameNotFoundException("User not found with initial: " + userInitials);
			}

		}

	}

    public boolean validatePass(String given, String saved) throws Exception{

    	boolean hash=bcryptEncoder.matches(given,saved);
		if(hash){
			return true;
		}else{
			throw new Exception("INVALID_CREDENTIALS");
		}
	}

    public void authenticate(String initial,String password) throws Exception {
		UserEntity user = userRepository.findByEmail(initial);
		if(user!=null){
			validatePass(password,user.getPassword());
		}
		else{
			UserEntity user2 = userRepository.findByPersonalCode(initial);
			if(user2!=null){
				validatePass(password,user2.getPassword());
			}else{
				throw new UsernameNotFoundException("User not found with initial: " + initial);
			}
		}
	}

    public UserEntity save(UserEntity user) {
        UserEntity newUser = new UserEntity();
        UserEntity userEntity = userRepository.findByPersonalCodeOrEmail(user.getPersonalCode(), user.getEmail());
        if (userEntity != null) {
            throw new RequestRejectedException("User is already registered");
        }
        user.setPassword(bcryptEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }
}