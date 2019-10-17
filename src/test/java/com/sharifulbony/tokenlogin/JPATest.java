package com.sharifulbony.tokenlogin;

import com.sharifulbony.tokenlogin.user.UserEntity;
import com.sharifulbony.tokenlogin.user.UserRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

import static org.assertj.core.api.Java6Assertions.assertThat;

@RunWith(SpringRunner.class)
@DataJpaTest
public class JPATest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    UserRepository userRepository;



    @Test
    public void whenFindByEmail_thenReturnUser() {

        UserEntity userEntity = new UserEntity();
        userEntity.setEmail("test@email.com");
        userEntity.setFirstName("test");
        userEntity.setLastName("user");
        userEntity.setBirthDate(new Date(System.currentTimeMillis()));
        userEntity.setPassword("password");
        userEntity.setPersonalCode("1234");
        entityManager.persist(userEntity);
        entityManager.flush();

//         when
        UserEntity found = userRepository.findByEmail(userEntity.getEmail());

        // then
        assertThat(found.getEmail())
                .isEqualTo(userEntity.getEmail());
    }

}
