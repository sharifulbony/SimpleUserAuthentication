package com.sharifulbony.tokenlogin;
import com.sharifulbony.tokenlogin.JWT.JwtRequest;
import com.sharifulbony.tokenlogin.JWT.JwtResponse;
import com.sharifulbony.tokenlogin.JWT.JwtTokenUtil;;
import com.sharifulbony.tokenlogin.user.UserEntity;
import com.sharifulbony.tokenlogin.user.UserService;
import com.sharifulbony.tokenlogin.user.UserRepository;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.firewall.RequestRejectedException;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 *
 */
@RestController
@RequestMapping(value = "")
@Api(value = "Product Inventory System", description = "Operations related to Product Inventory Management System")

public class RESTController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Autowired
    private UserService userDetailsService;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ApiOperation(value = DocumentationStaticContext.userRegisterDescription, response = Iterable.class)
    public ResponseEntity<?> saveUser(@ApiParam(value = DocumentationStaticContext.userRegisterParam) @RequestBody UserEntity user) throws Exception {
        return ResponseEntity.ok(userDetailsService.save(user));
    }

    @RequestMapping(value = "/get-user")
    @ApiOperation(value = DocumentationStaticContext.userRegisterDescription, response = Iterable.class)
    public List<UserEntity> getUser(@ApiParam(value = DocumentationStaticContext.userRegisterParam) HttpServletRequest request) throws Exception {
        final String requestTokenHeader = request.getHeader("Authorization");
        String initial=userDetailsService.parseUserNameFromToken(requestTokenHeader);
        UserEntity userEntity=userDetailsService.loadUserByInitials(initial) ;
        ArrayList<UserEntity> userEntities=new ArrayList<>();
        userEntities.add(userEntity);
        return userEntities;
    }

    @RequestMapping(value = "/authenticate", method = RequestMethod.POST)
    @ApiOperation(value = DocumentationStaticContext.userAuthenticationDescription, response = Iterable.class)
    public ResponseEntity<?> createAuthenticationToken(@ApiParam(value = DocumentationStaticContext.userAuthenticationParam) @RequestBody JwtRequest authenticationRequest) throws Exception {

        userDetailsService.authenticate(authenticationRequest.getUsername(), authenticationRequest.getPassword());
        UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequest.getUsername());
        final String token = jwtTokenUtil.generateToken(userDetails);
        return ResponseEntity.ok(new JwtResponse(token));
    }


    @RequestMapping(value = "/refresh-token")
    @ApiOperation(value = DocumentationStaticContext.userAuthenticationDescription, response = Iterable.class)
    public ResponseEntity<?> refreshAuthenticationToken(@ApiParam(value = DocumentationStaticContext.userAuthenticationParam)HttpServletRequest request) throws Exception {

        final String requestTokenHeader = request.getHeader("Authorization");
        String username=userDetailsService.parseUserNameFromToken(requestTokenHeader);
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        final String token = jwtTokenUtil.generateToken(userDetails);
        return ResponseEntity.ok(new JwtResponse(token));
    }

    @RequestMapping(value = "/renew-token")
    @ApiOperation(value = DocumentationStaticContext.userAuthenticationDescription, response = Iterable.class)
    public ResponseEntity<?> renewAuthenticationToken(@ApiParam(value = DocumentationStaticContext.userAuthenticationParam)HttpServletRequest request) throws Exception {

        final String requestTokenHeader = request.getHeader("Authorization");
        String jwtToken = requestTokenHeader.substring(7);
        String username=userDetailsService.parseUserNameFromToken(requestTokenHeader);
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        Date expireTime=jwtTokenUtil.getExpirationDateFromToken(jwtToken);
        Long currentTime=System.currentTimeMillis();
        Long withinPolicyTime=expireTime.getTime()+ Policy.tokenRenewPolicy;
        if (currentTime<withinPolicyTime){
            final String token = jwtTokenUtil.generateToken(userDetails);
            return ResponseEntity.ok(new JwtResponse(token));
        }else {
            throw new RequestRejectedException("Token can not be renewed after Five minutes: ");
        }


    }





}
