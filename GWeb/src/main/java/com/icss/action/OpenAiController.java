package com.icss.action;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.icss.biz.OpenAiService;

@RestController

public class OpenAiController {

    @Autowired
    private OpenAiService openAiService;

    @RequestMapping("/analyzeGameName")
    public String analyzeGameName(@RequestParam String gname) throws IOException {
        return openAiService.getGameName(gname);
    }
}
