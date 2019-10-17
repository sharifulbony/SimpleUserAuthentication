//package com.sharifulbony.tokenlogin;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//
//import com.sharifulbony.tokenlogin.JWT.JwtRequestFilter;
//import com.sharifulbony.tokenlogin.JWT.JwtTokenUtil;
//import com.sharifulbony.tokenlogin.user.UserEntity;
//import com.sharifulbony.tokenlogin.user.UserService;
//import com.sharifulbony.tokenlogin.user.UserDTO;
//import com.sharifulbony.tokenlogin.user.UserRepository;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
//import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
//import org.springframework.boot.test.mock.mockito.MockBean;
//import org.springframework.http.MediaType;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers;
//import org.springframework.security.web.FilterChainProxy;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import org.springframework.web.context.WebApplicationContext;
//
//import java.util.*;
//import static org.mockito.BDDMockito.given;
//import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
//import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.*;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
//
///**
// *
// */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration
//@WebAppConfiguration
//@WebMvcTest(value = RESTController.class,secure = false)
//@AutoConfigureMockMvc(secure = false)
//
////@SpringBootTest
//public class RESTControllerTest {
//
//
//
//    @MockBean
//    UserRepository userRepository;
//
//    @MockBean
//    private AuthenticationManager authenticationManager;
//    @MockBean
//    private JwtTokenUtil jwtTokenUtil;
//
//    @MockBean
//    private UserService userDetailsService;
//
//
//
//    @MockBean
//    private JwtRequestFilter jwtRequestFilter;
//
//    @MockBean
//    FilterChainProxy springSecurityFilterChain;
//
//    @Autowired
//    private WebApplicationContext context;
//
//
//
//
//    @Autowired
//    private MockMvc mvc;
//
//    @Before
//    public void setup() {
//        mvc = MockMvcBuilders
//                .webAppContextSetup(context)
//                .alwaysDo(print())
//                .apply(SecurityMockMvcConfigurers.springSecurity())
//                .build();
//    }
//
//
//
////    @Test
////    public void saveUser() throws Exception {
////
////        UserEntity userEntity = new UserEntity();
////        userEntity.setEmail("test@email.com");
////        userEntity.setFirstName("test");
////        userEntity.setLastName("user");
////        userEntity.setBirthDate(new Date(System.currentTimeMillis()));
////        userEntity.setPassword("password");
////        userEntity.setPersonalCode("1234");
////
////        mvc.perform(
////                post("/register").
////                        content(asJsonString(userEntity))
////                        .contentType(MediaType.APPLICATION_JSON)
////                        .accept(MediaType.APPLICATION_JSON)
////        ).andExpect(status().isOk());
////
////    }
//
//
//
//    public static String asJsonString(final Object obj) {
//        try {
//            return new ObjectMapper().writeValueAsString(obj);
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//
//}
