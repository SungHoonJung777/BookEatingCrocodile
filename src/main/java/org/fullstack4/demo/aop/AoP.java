package org.fullstack4.demo.aop;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
@Log4j2
public class AoP {
    @Before("within(org.fullstack4.demo..*)")
    public void beforeMethod() {
        log.info("---------------method start before--------------------");

        log.info("---------------end--------------------");
    }

    @After("within(org.fullstack4.demo..*)")
    public void afterMethod(){
        log.info("---------------method start before--------------------");
    }


    public void springAop(JoinPoint jpt){
        Signature signature =  jpt.getSignature();
        log.info("================================="+jpt);
        log.info("===============실행 타입 "+signature);
        log.info("===============실행 타입 "+signature.getName());
        log.info("================================="+jpt);
    }

}
