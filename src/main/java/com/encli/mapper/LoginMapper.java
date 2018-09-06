package com.encli.mapper;

import com.encli.model.User;

/**
 * Created by ZZP on 2018/8/16.
 */
public interface LoginMapper  {

    //用户登录查询
    User check(User user);


}
