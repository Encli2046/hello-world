package com.encli.service.serviceI;

import com.encli.mapper.LoginMapper;
import com.encli.model.User;
import com.encli.service.LoginServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Encli on 2018/8/16.
 */
@Service("loginService")
public class LoginServiceImpl implements LoginServiceI{

    @Autowired
    private LoginMapper loginMapper;

    @Override
    public User check(User user) {
        return loginMapper.check(user);
    }

}
