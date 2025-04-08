package com.example.security.hist.controller;

import com.example.security.hist.service.HistService;
import com.example.security.hist.vo.HistVO;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@AllArgsConstructor
@RequestMapping("/hist")
public class HistController {

    private final HistService histService;

    @GetMapping("/loginHistory")
    public String hist(){
        return "loginHistory";
    }

    @PostMapping("/getHistory")
    public @ResponseBody List<HistVO> getHistory(){
        return histService.getHistList();
    }

    @PostMapping("/insertHistory")
    public ResponseEntity<Map<String, Object>> insertHistory(@RequestParam String username){
        Map<String, Object> map = new HashMap<>();

        histService.insertHist(username);

        map.put("msg", "success");

        return ResponseEntity.ok(map);
    }


}
