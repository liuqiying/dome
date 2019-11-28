package com.fh.test;

import com.fh.common.Ignore;
import com.fh.model.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("dome")
public class restfulTest {


    @GetMapping("gget")
    public void gget(){
        System.out.println("get请求");
    }

    @PostMapping("aa")
    @Ignore
    public void aa(User user){
        System.out.println(user.getAge()+"===="+user.getUserName());
        System.out.println("aaaaaaaaaaaaaa");
    }
}
