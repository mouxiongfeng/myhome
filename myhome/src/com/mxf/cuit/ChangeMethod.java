package com.mxf.cuit;

import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

/**
 * ����Bean,Map,JSON֮����໥ת��
 * @author mouxf
 *
 */
public class ChangeMethod {
	/**
	 * request�еļ�ֵ�ԣ�ת����map
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
     * ��Beanת����Map 
     * @param javaBean javaBean 
     * @return Map���� 
     */ 
    public static Map<String, Object> beanToMap(Object javaBean) 
    { 
        Map<String, Object> result = new HashMap<String, Object>(); 
        Method[] methods = javaBean.getClass().getDeclaredMethods(); 
        for (Method method : methods) 
        { 
            try { 
                if (method.getName().startsWith("get")){ //ȡ��bean�е�get����������key��value
                    String field = method.getName(); 
                    field = field.substring(field.indexOf("get") + 3); //���У�ȥ��get����get������ֶ�
                    field = field.toLowerCase().charAt(0) + field.substring(1); 
                    Object value = method.invoke(javaBean, (Object[])null); 
                    result.put(field, null == value ? "" : value.toString());//����Mapֵ 
                } 
            } catch (Exception e) { 
            	} 
        } 
        return result; 
    } 
    
    /** 
     * ��json����ת����Map 
     * 
     * @param jsonObject json���� 
     * @return Map���� 
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
     * ��mapת����Javabean 
     * 
     * @param javabean javaBean 
     * @param data map���� 
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
