package com.capitolis.rookoutslfproblem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class RookoutSlfProblemApplication {

    @Autowired
    LogAndExit logAndExit;

    public static void main(String[] args) {
        SpringApplication.run(RookoutSlfProblemApplication.class, args);
    }

}
