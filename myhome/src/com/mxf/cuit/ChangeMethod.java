package com.mxf.cuit;

import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

/**
 * 用于Bean,Map,JSON之间的相互转换
 * @author mouxf
 *
 */
public class ChangeMethod {
	/**
	 * request中的键值对，转换成map
	 * @param request
	 * @return
	 */
	public static Map<String, Object> getRequestParams(HttpServletRequest request) {
        HashMap<String, Object> data = new HashMap<String, Object>();
        Enumeration<String> e = request.getParameterNames();
        while (e.hasMoreElements()) {
            String key = e.nextElement();
            data.put(key, request.getParameter(key));
        }
        return data;
    }
	
	 /** 
     * 将Bean转换成Map 
     * @param javaBean javaBean 
     * @return Map对象 
     */ 
    public static Map<String, Object> beanToMap(Object javaBean) 
    { 
        Map<String, Object> result = new HashMap<String, Object>(); 
        Method[] methods = javaBean.getClass().getDeclaredMethods(); 
        for (Method method : methods) 
        { 
            try { 
                if (method.getName().startsWith("get")){ //取得bean中的get方法并设置key与value
                    String field = method.getName(); 
                    field = field.substring(field.indexOf("get") + 3); //剪切，去掉get保留get后面的字段
                    field = field.toLowerCase().charAt(0) + field.substring(1); 
                    Object value = method.invoke(javaBean, (Object[])null); 
                    result.put(field, null == value ? "" : value.toString());//设置Map值 
                } 
            } catch (Exception e) { 
            	} 
        } 
        return result; 
    } 
    
    /** 
     * 将json对象转换成Map 
     * 
     * @param jsonObject json对象 
     * @return Map对象 
     */ 
    @SuppressWarnings("unchecked") 
    public static Map<String, String> jsoinToMap(JSONObject jsonObject) { 
        Map<String, String> result = new HashMap<String, String>(); 
        Iterator<String> iterator = jsonObject.keys(); 
        String key = null; 
        String value = null; 
        while (iterator.hasNext()) 
        { 
            key = iterator.next(); 
            value = jsonObject.getString(key); 
            result.put(key, value); 
        } 
        return result; 
    } 
    
    /** 
     * 将map转换成Javabean 
     * 
     * @param javabean javaBean 
     * @param data map数据 
     */ 
    public static Object mapToBean(Object javabean, Map<String, String> data) { 
        Method[] methods = javabean.getClass().getDeclaredMethods(); 
        for (Method method : methods)  { 
            try  { 
                if (method.getName().startsWith("set")) { 
                    String field = method.getName(); 
                    field = field.substring(field.indexOf("set") + 3); 
                    field = field.toLowerCase().charAt(0) + field.substring(1); 
                    method.invoke(javabean, new Object[] 
                    { 
                        data.get(field) 
                    }); 
                } 
            } 
            catch (Exception e) { 
            } 
        } 
        return javabean; 
    } 
}
