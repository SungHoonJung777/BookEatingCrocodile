package org.fullstack4.demo.sample;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
@ToString
public class SampleService {
    @Autowired
    @Qualifier("event")
    private final SampleDAO sampleDAO;

}
