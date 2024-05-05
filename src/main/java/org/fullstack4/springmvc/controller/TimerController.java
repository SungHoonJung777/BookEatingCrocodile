package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import org.fullstack4.springmvc.service.blackFriday.BlackFirdayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class TimerController {
    @Autowired
    private BlackFirdayService blackFirdayService;

    @RequestMapping(value = "/getRemainingTime" , method = RequestMethod.GET)
    public Map<String, Integer> getRemainingTime() {
        int time = blackFirdayService.getTime();

        Map<String, Integer> response = new HashMap<>();
        response.put("time", time);
        System.out.println("response: " + response);
        return response;
    }
}