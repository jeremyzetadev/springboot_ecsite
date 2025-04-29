package com.ecom.service.Impl;

import com.ecom.service.CommonService;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class CommonServiceImpl implements CommonService {
    @Override
    public void removeSessionMessage() {
        HttpServletRequest req = ((ServletRequestAttributes)(RequestContextHolder.getRequestAttributes())).getRequest();
        HttpSession session = req.getSession();
        session.removeAttribute("succMsg");
        session.removeAttribute("errorMsg");
    }
}
