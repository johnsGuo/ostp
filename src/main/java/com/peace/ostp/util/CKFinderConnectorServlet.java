package com.peace.ostp.util;



import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.ckfinder.connector.ConnectorServlet;
import com.peace.ostp.util.FileUtils;
import com.peace.ostp.util.StringUtil;


public class CKFinderConnectorServlet extends ConnectorServlet{

private static final long serialVersionUID = 1L;
    public static final String USERFILES_BASE_URL = "userfiles/";

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        prepareGetResponse(request, response, false);
        super.doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        prepareGetResponse(request, response, true);
        super.doPost(request, response);
    }

    private void prepareGetResponse(HttpServletRequest request,
            HttpServletResponse response, final boolean post) {
       /* String type = request.getParameter("type");
        String command = request.getParameter("command");
        //创建文件夹
        if(type!=null){
        	type = type.toLowerCase();
        }
        String folderPath = ""; 
        if (!"Init".equals(command)){
            //获取webcontent下的路径
        	String startPath = request.getParameter("startupPath");
        	System.out.println("+++++"+startPath);
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            folderPath = StringUtil.replace(rootPath, "\\", "/") + USERFILES_BASE_URL + type + "/" + getCurrTime() + "/";
            System.err.println("================"+folderPath);
            FileUtils.createDirectory(folderPath);
        }else if("QuickUpload".equals(command)){
        	 String currentPath = request.getParameter("currentFolder");
        	 System.out.println(currentPath);
        	 String rootPath = request.getSession().getServletContext().getRealPath("/");
             folderPath = StringUtil.replace(rootPath, "\\", "/") + USERFILES_BASE_URL + type + "/" + getCurrTime() + "/";
             //System.err.println(folderPath);
             FileUtils.createDirectory(folderPath);
        }*/
    	
    	String command = request.getParameter("command");  
        String type = request.getParameter("type");  
        // 初始化时，如果startupPath文件夹不存在，则自动创建startupPath文件夹  
        if ("Init".equals(command)){  
                String startupPath = request.getParameter("startupPath");// 当前文件夹可指定为模块名  
                System.out.println("++++"+startupPath);
                if (startupPath!=null){  
                    String[] ss = startupPath.split(":");  
                    if (ss.length==2){  
                        String path = "/userfiles/"+ss[0]+ss[1];  
                        String realPath = request.getSession().getServletContext().getRealPath(path);
                        System.out.println("realpath:"+realPath);
                        FileUtils.createDirectory(realPath);  
                    }  
                }  
        }  
        // 快捷上传，自动创建当前文件夹，并上传到该路径  
        else if ("QuickUpload".equals(command) && type!=null){  
                String currentFolder = request.getParameter("currentFolder");// 当前文件夹可指定为模块名  
                System.out.println("======"+currentFolder);
                String path = "/userfiles/"+type+(currentFolder!=null?currentFolder:"");  
                String realPath = request.getSession().getServletContext().getRealPath(path);  
                System.out.println("realpath:"+realPath);
                FileUtils.createDirectory(realPath);  
        }  
//      System.out.println("------------------------");  
//      for (Object key : request.getParameterMap().keySet()){  
//          System.out.println(key + ": " + request.getParameter(key.toString()));  
//      } 
    }


    private String getCurrTime() {
        Calendar cal = Calendar.getInstance();
        return cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH)+ 1)+"/"+(cal.get(Calendar.DAY_OF_MONTH));
    }
    public static void main(String[] args) {
		System.out.println(new CKFinderConnectorServlet().getCurrTime());
	}
}