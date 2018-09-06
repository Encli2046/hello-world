package com.encli.controller;

import com.encli.model.User;
import com.encli.service.LoginServiceI;
import com.encli.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by ZZP on 2018/8/16.
 */
@RequestMapping("login")
@Controller
public class LoginController {

    @Autowired
    LoginServiceI loginService;


    //去登陆页面
    @RequestMapping
    public String  toLoginPage(){
        return "login";
    }


    //登陆验证
    @RequestMapping("check")
    @ResponseBody
    public JsonResult check(User user){

        User result = loginService.check(user);
        JsonResult jsonResult = new JsonResult();

        if ( null != result ){
            jsonResult.setStatus(200);
        }else {
            jsonResult.setStatus(400);
        }

        return jsonResult;

    }

}
