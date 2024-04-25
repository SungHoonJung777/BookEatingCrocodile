package org.fullstack4.springmvc.sample;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

//@ToString
//@Service
//public class SampleService {
//
//    @Autowired
//    //이놈 하나로 기본생성자로 의존성 주입 해주는 그런 작업이 필요가 없어졌어! "의존성을 주입해 주세요."
//    //스프링아, 의존성 주입해줘, 이것을 사용한 클래스(SapmleService) 생성자를 호출할 때 sampleDAO를 집어넣고 생성해줘! 라고 요청하는 것
//    //해당 bean 이 root-context.xml에 추가되어 있어야 함!
//    // == 반드시 그 대상은 bean 이어야 함
//    private SampleDAO sampleDAO;
//    // 의존성 주입을 할 애들은 원래 보통 private final로 함
//
//
//}

@ToString
@Service
@RequiredArgsConstructor //파라미터가 있는 생성자를 반드시 만들어서 써야해
//@NoArgsConstructor
//@AllArgsConstructor
// 클래스 단에서 선언되어있는 애들은 보통 클래스가 생성되는 시점에 의존성 주입
// 해당 클래스가 컴파일 되는 시점에 annotation 동작함. 오류사항이 있으면 컴파일 시점에 오류 띄워짐
// 딱 그놈한테만 영향받는 놈이면 메서드 단에서,,
// 근데 안정적으로 운영하고싶다 하면 클래스 단에다가 선언하기
// 메서드단에서 선언했는데 오류를 알고 싶으면 일단 클래스 단에다가 선언해서 확인해보는 것도 좋은 방법임
// xml은 컴파일 시점에 알 수 있고 , annotation은 런타임 시점에 알 수 있음
public class SampleService {

//    @Autowired 없어도 동작함!

    // 메서드 단에서 선언되는 애들은 해당 메서드를 호출하는 시점에 의존성 주입
    // 운영에 올라가서 그 메서드를 호출할 때 오류 띄워짐(런타임 시점에)
    @Qualifier("event")
    //@Autowired
    private final SampleDAO sampleDAO; //컴파일 시점에 static 영역으로 이동하는 final



}