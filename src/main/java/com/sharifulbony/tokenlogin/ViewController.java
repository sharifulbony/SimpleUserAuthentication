package com.sharifulbony.tokenlogin;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/simple-auth")
@Api(value = "Authentication System", description = "Operations related to Simple Authentication")
public class ViewController {


    @ApiOperation(value = DocumentationStaticContext.mainPageDescription, response = Iterable.class)
    @RequestMapping(value = "/authenticate", method = RequestMethod.GET)
    public ModelAndView getAuth()
    {
        return new ModelAndView("auth");
    }



}
