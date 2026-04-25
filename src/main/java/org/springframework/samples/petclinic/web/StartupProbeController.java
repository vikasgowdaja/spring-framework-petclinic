package org.springframework.samples.petclinic.web;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
class StartupProbeController {

    @GetMapping(path = "/health", produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    ResponseEntity<String> health() {
        return ResponseEntity.ok("OK");
    }

}