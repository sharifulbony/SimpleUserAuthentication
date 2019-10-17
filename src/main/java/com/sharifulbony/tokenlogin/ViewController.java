package com.sharifulbony.tokenlogin;


import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "/simple-auth")
@Api(value = "Authentication System", description = "Operations related to Simple Authentication")
public class ViewController {



    @RequestMapping(value = "/authenticate", method = RequestMethod.GET)
    public ModelAndView getAuth()
    {
        return new ModelAndView("auth");
    }



}
