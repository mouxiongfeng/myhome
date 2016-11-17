package com.mxf.cuit.index;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mxf.cuit.page.PagePath;

@Controller
@RequestMapping("/index")
public class IndexController {

	@RequestMapping(value="/welcome",method=RequestMethod.GET)
	public String toIndex(){
		return PagePath.INDEX_WELCOME;
	}
}
