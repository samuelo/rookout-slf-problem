package com.capitolis.rookoutslfproblem;

import javax.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class LogAndExit {
    @PostConstruct
    public void logAndExit() {
        log.info("Print and Exit");
        System.exit(0);
    }
}
