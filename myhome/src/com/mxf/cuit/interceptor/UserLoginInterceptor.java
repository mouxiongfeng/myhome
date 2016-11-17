package com.mxf.cuit.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class UserLoginInterceptor implements HandlerInterceptor{
  private static final String[] IGNORE_URI = {"/login", "/register"};
  @Override
  public void afterCompletion(HttpServletRequest arg0,
      HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
    // TODO Auto-generated method stub
    
  }

  @Override
  public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
      Object arg2, ModelAndView arg3) throws Exception {
    // TODO Auto-generated method stub
    
  }

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
      Object object) throws Exception {
    boolean flag = false;
    String url = request.getRequestURL().toString();
    for (String s : IGNORE_URI) {
      if (url.contains(s)) {
        flag = true;
        break;
      }//if (url.contains(s))
    }//for (String s : IGNORE_URI)
    if (!flag) {
      if (request.getSession().getAttribute("user") != null || request.getSession().getAttribute("admin") != null) {
        flag = true;
      }//if (user.getUserName() != null)
      else{
        request.getRequestDispatcher("/user/login").forward(request, response);
        //response.sendRedirect(request.getContextPath()+"/userLogin.jsp");
      }
    }//if (!flag)
    return flag;
  }
}