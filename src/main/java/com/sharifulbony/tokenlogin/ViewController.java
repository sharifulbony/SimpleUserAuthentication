package com.sharifulbony.tokenlogin;


import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "/simple-auth")
@Api(value = "Ticketing System", description = "Operations related to Ticketing System")
public class ViewController {


    @RequestMapping(value = "/get-dashboard", method = RequestMethod.GET)
    public ModelAndView getDashboard()
    {
        return new ModelAndView("welcome");
    }

    @RequestMapping(value = "/auth", method = RequestMethod.GET)
    public ModelAndView getAuth()
    {
        return new ModelAndView("auth");
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getLogin(){
        return new ModelAndView("login");
    }


}
