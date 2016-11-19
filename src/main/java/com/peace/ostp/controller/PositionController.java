package com.peace.ostp.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.peace.ostp.domain.PositionDetailInfo;
import com.peace.ostp.service.IBasicSportType;
import com.peace.ostp.service.IPositionInfo;
import com.peace.ostp.util.DrawImageUtil;
import com.peace.ostp.util.FileUpload;
import com.peace.ostp.util.Page;
import com.peace.ostp.util.PagingUtil;
import com.peace.ostp.util.StringUtil;


/**
 * 位置控制器
 * @author YLS
 *
 */
@Controller
@RequestMapping("admin")
public class PositionController {

	@Autowired
	//@Qualifier("one")
	private IPositionInfo positionInfoService;
	
	@Autowired
	private IBasicSportType basicSportTypeService;

	//分页的每页数量
	private Integer PER_PAGE_NUM = 1;
	
	@Autowired
	/*当一个接口有多个实现类的时候，可以使用@Qualifier中的参数和@Service中的参数配合使用，从而实现多实现的自动注入
	@Qualifier("two")*/
	private IPositionInfo two;
	
	/**
	 * 格式化日期，因为springmvc不能自己对日期格式化
	 * @param binder
	 */
    @InitBinder
    public void initBinder(WebDataBinder binder) {  
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        dateFormat.setLenient(false);  
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
    }
    
    /**
     * 获取添加页面需要的初始数据
     * @param request
     * @return
     */
    @RequestMapping(value = "/position-add", method = RequestMethod.GET)
	public ModelAndView weizhi_addGet(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//当页面加载的时候获取初始数据
		//运动类型sportType，位置类型positionType
		List<Map<String, String>> sportType = new ArrayList<Map<String,String>>();
		List<Map<String, String>> positionTypes = new ArrayList<Map<String,String>>();
		
		sportType.addAll(basicSportTypeService.SportTypeCombox());
		positionTypes.addAll(positionInfoService.getPositionType());
		
		mav.addObject("sportType", sportType);
		mav.addObject("positionTypes", positionTypes);
		mav.setViewName("admin/position/position_add");
		return mav;
	}
    
    /**
     * 位置添加方法
     * @param positionDetailInfo
     * @return
     */
    @RequestMapping(value = "/position-insert", method = RequestMethod.POST)
	private String positionInsert(PositionDetailInfo positionDetailInfo,@RequestParam("picture") MultipartFile file,HttpServletRequest request){
    	FileUpload fileUpload = new FileUpload();
    	try {
    		fileUpload.uploadFile(file, request);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	//缩略图上传，初始化工作
    	DrawImageUtil img = new DrawImageUtil(file, request, fileUpload);
    	//缩略工作
    	img.resizeFix();
    	
		positionDetailInfo.setPositionpicture(fileUpload.getFilePath(file));
		positionDetailInfo.setPositionthumbnailpicture(img.getThumbnailPath());
		positionDetailInfo.setPositionid(StringUtil.getUuid());
		
		int result = positionInfoService.insert(positionDetailInfo);
		if(result > 0){
			return "redirect:position-list";
		} else {
			return "admin/position/position_list";
		}
	}
    
    /**
     * 查看位置详细信息
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/position-view", method = RequestMethod.GET)
	public String positionView(String positionid, String positiontypeid, String sporttypeid, HttpServletRequest request) {
    	PositionDetailInfo positionDetailInfo = positionInfoService.getPositionInfo(positionid, positiontypeid, sporttypeid);
    	request.setAttribute("positionDetailInfo", positionDetailInfo);
		return "admin/position/position_view";
	}
    
   /**
    * 查询单个位置的详细信息
    * @param positionid
    * @param positiontypeid
    * @param sporttypeid
    * @param request
    * @return
    */
    @RequestMapping(value = "/position", method = RequestMethod.GET)
	public String positionAdd(String positionid, String positiontypeid, String sporttypeid, HttpServletRequest request) {
    	
    	//当页面加载的时候获取初始数据
		List<Map<String, String>> sportType = new ArrayList<Map<String,String>>();
		List<Map<String, String>> positionTypes = new ArrayList<Map<String,String>>();
		PositionDetailInfo positionDetailInfo = positionInfoService.getPositionInfo(positionid, positiontypeid, sporttypeid);
		
		sportType.addAll(basicSportTypeService.SportTypeCombox());
		positionTypes.addAll(positionInfoService.getPositionType());
		
		request.setAttribute("sportType", sportType);
		request.setAttribute("positionTypes", positionTypes);
    	request.setAttribute("positionDetailInfo", positionDetailInfo);
    	return "admin/position/position_edit";
	}
    
    /**
     * 更新位置信息
     * @param positionDetailInfo
     * @return
     */
    @RequestMapping(value = "/position-update", method = RequestMethod.POST)
    public String positionUpdate(PositionDetailInfo positionDetailInfo, @RequestParam("picture") MultipartFile file, HttpServletRequest request) {
    	FileUpload fileUpload = new FileUpload();
    	if (!file.isEmpty()) {//如果更新图片，则把原来的旧图片删除
    		fileUpload.deletFile(positionDetailInfo.getPositionpicture(), request);
    		try {
    			fileUpload.uploadFile(file, request);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	int result = positionInfoService.updatePositionInfo(positionDetailInfo);
		if(result > 0){
			return "redirect:position-list";
		} else {
			return "admin/position/position_list";
		}
    }
    
    /**
     * 删除位置
     * @param positionid 位置id
     * @param positionpicture 图片位置
     * @param request
     * @return
     */
    @RequestMapping(value = "/position-del", method = RequestMethod.GET)
    public String positionDelete(String positionid, String positionpicture, HttpServletRequest request) {
    	FileUpload fileUpload = new FileUpload();
    	fileUpload.deletFile(positionpicture, request);
    	positionInfoService.deleteByPrimaryKey(positionid);
    	return "redirect:position-list";
    }
    
    /**
     * 查询位置的集合,包括组合查询
     * @param positionDetailInfo
     * @param request
     * @return
     */
    @RequestMapping(value = "/position-list")
	public ModelAndView positionsList(PositionDetailInfo positionDetailInfo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//当页面加载的时候获取初始数据
		//运动类型sportType，位置类型positionType，数据库中已存在的数据positionInfos
		List<Map<String, String>> sportType = new ArrayList<Map<String,String>>();
		List<Map<String, String>> positionTypes = new ArrayList<Map<String,String>>();
		//List<PositionDetailInfo> positionInfos = new ArrayList<PositionDetailInfo>();
		
		sportType.addAll(basicSportTypeService.SportTypeCombox());
		positionTypes.addAll(positionInfoService.getPositionType());
		//positionInfos = positionInfoService.getPositionInfos(positionDetailInfo);
		
		/*=====分页 start======*/
		int index = 1;
		if (request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		Page<PositionDetailInfo> page = new Page<PositionDetailInfo>();
		page.setPageNo(index);
		page.setPageSize(PER_PAGE_NUM);
		page.setTotalRecord(positionInfoService.getTotalRecord(positionDetailInfo));
		//存储查询参数
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		page.setResults(positionInfoService.getPositionInfos(positionDetailInfo,map));
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/position-list-page");
		/*=====分页 end======*/
		mav.addObject("pageStr", pageStr);
		mav.addObject("sportType", sportType);
		mav.addObject("positionTypes", positionTypes);
		mav.addObject("positionInfo", positionDetailInfo);
		mav.addObject("positionInfos", page);
		mav.setViewName("admin/position/position_list");
		return mav;
	}
    
    
    @RequestMapping("/position-list-page")
    public void positionsPage(@RequestParam("page") Integer index,PositionDetailInfo positionDetailInfo, HttpServletResponse response) {
    	/*=====分页 start======*/
    	Page<PositionDetailInfo> page = new Page<PositionDetailInfo>();
		page.setPageNo(index);
		page.setPageSize(PER_PAGE_NUM);
		page.setTotalRecord(positionInfoService.getTotalRecord(positionDetailInfo));
		//存储查询参数
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		page.setResults(positionInfoService.getPositionInfos(positionDetailInfo,map));
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/position-list-page");
		List<Object> list = new ArrayList<Object>();
		list.add(0,pageStr);
		list.add(1,page.getResults());
		/*=====分页 end======*/
		String strJson = JSON.toJSONString(list);
		try {
			response.getWriter().print(strJson);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
}