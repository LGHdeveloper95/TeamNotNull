package com.guguin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
      @RequestMapping("/")
      public String home() {
    	  return "home";
      }
      @RequestMapping("/test")
      @ResponseBody
      public String test() {
    	  return "<h2>Test</h2>";
    	  
      }
      
      
}
