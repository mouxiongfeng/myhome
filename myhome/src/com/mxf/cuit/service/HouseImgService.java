package com.mxf.cuit.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mxf.cuit.dao.HouseImgMapper;

@Service
public class HouseImgService {

	@Autowired
	private HouseImgMapper houseImgMapper;
	
	public Integer adddHouseImg(MultipartHttpServletRequest request,Integer houseId){
		Map<String,Object> paramMap = new HashMap<String,Object>();
		List<String> imgList = new ArrayList<String>();
		 List<MultipartFile> files = request.getFiles("file");
		 for(MultipartFile file:files){
	        //获得原始文件名
	        String fileName = file.getOriginalFilename();
	        //新文件名
	        String newFileName = UUID.randomUUID()+fileName;
	        //上传到什么地方
	        String path = request.getSession().getServletContext().getRealPath("/")+"images/";
	        String houseImg = "/myhome/images/" + newFileName;
	        imgList.add(houseImg);
	        File f = new File(path);
	        if(!f.exists())
	        	f.mkdirs(); //文件夹是空,则创建
	        if(!file.isEmpty()){
	            try {
	                FileOutputStream fos = new FileOutputStream(path+newFileName);
	                InputStream in = file.getInputStream();
	                int b = 0;
	                while((b=in.read())!=-1){
	                    fos.write(b);
	                }
	                fos.close();
	                in.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
		 }
		 paramMap.put("houseImgList", imgList);
		 paramMap.put("houseId", houseId);
		return houseImgMapper.adddHouseImg(paramMap);
	}
}
