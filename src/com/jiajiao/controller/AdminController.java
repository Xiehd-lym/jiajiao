package com.jiajiao.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jiajiao.bean.Admin;
import com.jiajiao.bean.Course;
import com.jiajiao.bean.DictInfo;
import com.jiajiao.bean.District;
import com.jiajiao.bean.FastOrderTeacher;
import com.jiajiao.bean.Member;
import com.jiajiao.bean.MemberOrderTeacher;
import com.jiajiao.bean.Orders;
import com.jiajiao.bean.Paper;
import com.jiajiao.bean.TakeOrders;
import com.jiajiao.bean.Teacher;
import com.jiajiao.service.AdminService;
import com.jiajiao.service.CourseService;
import com.jiajiao.service.DictInfoService;
import com.jiajiao.service.DistrictService;
import com.jiajiao.service.FastOrderTeacherService;
import com.jiajiao.service.MemberOrderTeacherService;
import com.jiajiao.service.MemberService;
import com.jiajiao.service.OrdersService;
import com.jiajiao.service.PaperService;
import com.jiajiao.service.TakeOrdersService;
import com.jiajiao.service.TeacherService;
import com.jiajiao.utils.CommonUtil;
import com.jiajiao.utils.MD5Utils;
import com.sun.xml.internal.bind.v2.TODO;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Resource
	private MemberOrderTeacherService memberOrderTeacherService;

	@Resource
	private MemberService memberService;

	@Resource
	private TeacherService teacherService;

	@Resource
	private FastOrderTeacherService fastOrderTeacherService;

	@Resource
	private CourseService courseService;

	@Resource
	private TakeOrdersService takeOrdersService;

	@Resource
	private OrdersService ordersService;

	@Resource
	private AdminService adminService;

	@Resource
	private DictInfoService dictInfoService;

	@Resource
	private DistrictService districtService;

	@Resource
	private PaperService paperService;

	@RequestMapping("login")
	public String login() {

		return "admin/login";
	}

	@RequestMapping("gologin")
	@ResponseBody
	public Map<String, Object> gologin(Admin admin, String verifyCode,
			HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		if (!(verifyCode.equalsIgnoreCase(session.getAttribute("code")
				.toString()))) { // ????????????????????????
			map.put("success", false);
			map.put("message", "??????????????????");
			return map;
		}

		Admin admin2 = adminService.login(admin);
		if (admin2 != null) {
			map.put("success", true);
			session.setAttribute("admin", admin2);
		} else {
			map.put("success", false);
			map.put("message", "?????????????????????");
		}

		return map;

	}

	@RequestMapping("index")
	public String index(HttpSession session) {

		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/admin/login.action";
		}

		return "admin/index";
	}

	@RequestMapping("home")
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/home");

		int memberTotal = memberService.countMemberTotal();// ????????????
		int banMemberTotal = memberService.countBanMemberTotal();// ???????????????

		int teacherTotal = teacherService.countTeacherTotal();// ????????????
		int pendingTeacherTotal = teacherService.countPendingTeacherTotal();// ??????????????????
		int banTeacherTotal = teacherService.countBanTeacherTotal();// ???????????????

		int ordersTotal = ordersService.countOrdersTotal();// ??????????????????
		int publishingFastOrderTotal = ordersService
				.countPublishingFastOrderTotal();// ????????????????????????
		int publishingOrderTotal = ordersService.countPublishingOrderTotal();// ?????????????????????
		int appointmentingOrderTotal = ordersService
				.countAppointmentingOrderTotal();// ????????????
		int refunddingOrderTotal = ordersService.countRefunddingOrderTotal();// ???????????????

		int priceTotal = ordersService.countPriceTotal();// ?????????

		modelAndView.addObject("memberTotal", memberTotal);
		modelAndView.addObject("teacherTotal", teacherTotal);
		modelAndView.addObject("ordersTotal", ordersTotal);
		modelAndView.addObject("priceTotal", priceTotal);
		modelAndView.addObject("banMemberTotal", banMemberTotal);
		modelAndView.addObject("pendingTeacherTotal", pendingTeacherTotal);
		modelAndView.addObject("banTeacherTotal", banTeacherTotal);
		modelAndView.addObject("publishingFastOrderTotal",
				publishingFastOrderTotal);
		modelAndView.addObject("publishingOrderTotal", publishingOrderTotal);
		modelAndView.addObject("appointmentingOrderTotal",
				appointmentingOrderTotal);
		modelAndView.addObject("refunddingOrderTotal", refunddingOrderTotal);

		return modelAndView;

	}

	@RequestMapping("appointTeacherList")
	public ModelAndView appointTeacherList(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();

		List<MemberOrderTeacher> memberOrderTeacherList = memberOrderTeacherService
				.findAllMemberOrderTeacher();

		modelAndView
				.addObject("memberOrderTeacherList", memberOrderTeacherList);

		modelAndView.setViewName("admin/appointTeacherList");

		return modelAndView;
	}

	@RequestMapping("memberShow")
	public ModelAndView memberShow(int id) {

		ModelAndView modelAndView = new ModelAndView();

		Member member = memberService.findByMemberId(id);

		modelAndView.addObject("member", member);
		modelAndView.setViewName("admin/memberShow");
		return modelAndView;
	}

	@RequestMapping("teacherShow")
	public ModelAndView teacherShow(int id) {

		ModelAndView modelAndView = new ModelAndView();

		Teacher teacher = teacherService.findByTeacherId(id);

		modelAndView.addObject("teacher", teacher);
		modelAndView.setViewName("admin/teacherShow");
		return modelAndView;
	}

	@RequestMapping("fastAppointTeacherList")
	public ModelAndView fastAppointTeacherList() {

		ModelAndView modelAndView = new ModelAndView();

		List<FastOrderTeacher> fastOrderTeacherList = fastOrderTeacherService
				.findAllFastORderTeacher();

		modelAndView.addObject("fastOrderTeacherList", fastOrderTeacherList);
		modelAndView.setViewName("admin/fastAppointTeacherList");
		return modelAndView;
	}

	@RequestMapping("fastOrderTeacherInfo")
	@ResponseBody
	public Map<String, Object> fastOrderTeacherInfo(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		FastOrderTeacher fastOrderTeacher = fastOrderTeacherService
				.findFastOrderTeacherInfoByFotId(id);

		if (fastOrderTeacher == null) {
			map.put("success", false);
			map.put("message", "????????????");
		} else {
			map.put("success", true);
			map.put("message", fastOrderTeacher);
		}

		return map;
	}

	@RequestMapping("updateFastOrderTeacherInfo")
	@ResponseBody
	public Map<String, Object> updateFastOrderTeacherInfo(
			FastOrderTeacher fastOrderTeacher) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = fastOrderTeacherService
				.updateFastOrderTeacherInfo(fastOrderTeacher);

		if (row != 0) {
			map.put("success", true);
			map.put("message", "????????????");
		} else {
			map.put("success", false);
			map.put("message", "????????????");
		}

		return map;
	}

	@RequestMapping("memberList")
	public ModelAndView memberList() {
		ModelAndView modelAndView = new ModelAndView();

		List<Member> memberList = memberService.findAllMember();

		modelAndView.addObject("memberList", memberList);
		modelAndView.setViewName("admin/memberList");

		return modelAndView;
	}

	@RequestMapping("stopMember")
	@ResponseBody
	public Map<String, Object> stopMember(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;
		row = memberService.changeMemberUse(id, 0);
		if (row != 0) {
			map.put("success", true);

		} else {
			map.put("success", false);
		}

		return map;
	}

	@RequestMapping("startMember")
	@ResponseBody
	public Map<String, Object> startMember(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;
		row = memberService.changeMemberUse(id, 1);
		if (row != 0) {
			map.put("success", true);

		} else {
			map.put("success", false);
		}

		return map;
	}

	@RequestMapping("memberInfo")
	@ResponseBody
	public Map<String, Object> memberInfo(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = memberService.findByMemberId(id);
		if (member == null) {
			map.put("success", false);
			map.put("message", "????????????");
		} else {
			map.put("success", true);
			map.put("message", member);
		}

		return map;
	}

	@RequestMapping("updateMemberInfo")
	@ResponseBody
	public Map<String, Object> updateMemberInfo(Member member) {

		Map<String, Object> map = memberService.updateMemberInfo(member);

		return map;
	}

	@RequestMapping("teacherList")
	public ModelAndView teacherList() {
		ModelAndView modelAndView = new ModelAndView();

		List<Teacher> teacherList = teacherService.findAllTeacherList();

		modelAndView.addObject("teacherList", teacherList);
		modelAndView.setViewName("admin/teacherList");

		return modelAndView;
	}

	@RequestMapping("stopTeacher")
	@ResponseBody
	public Map<String, Object> stopTeacher(int id) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;
		row = teacherService.changeTeacherUse(id, 0);
		if (row != 0) {
			map.put("success", true);

		} else {
			map.put("success", false);
		}

		return map;
	}

	@RequestMapping("startTeacher")
	@ResponseBody
	public Map<String, Object> startTeacher(int id) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;
		row = teacherService.changeTeacherUse(id, 1);
		if (row != 0) {
			map.put("success", true);

		} else {
			map.put("success", false);
		}

		return map;
	}

	@RequestMapping("teacherInfo")
	public ModelAndView teacherInfo(int tId, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		Teacher teacher = teacherService.findByTeacherId(tId);

		session.setAttribute("teacher", teacher);//????????????session????????????????????????????????????????????????????????????

		List<Course> courseList = courseService.findAllCourseList();

		modelAndView.addObject("teacher", teacher);
		modelAndView.addObject("courseList", courseList);
		modelAndView.setViewName("admin/teacherInfo");

		return modelAndView;
	}

	@RequestMapping("auditTeacher")
	@ResponseBody
	public Map<String, Object> auditTeacher(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;
		row = teacherService.auditTeacher(id, 1);
		if (row == 0) {
			map.put("success", false);
		} else {
			map.put("success", true);
		}

		return map;
	}

	@RequestMapping("takeOrderList")
	public ModelAndView takeOrderList() {

		ModelAndView modelAndView = new ModelAndView();

		List<TakeOrders> takeOrderList = takeOrdersService.findAllTakeOrder();

		modelAndView.addObject("takeOrderList", takeOrderList);
		modelAndView.setViewName("admin/takeOrderList");
		return modelAndView;
	}

	@RequestMapping("takeOrderInfo")
	@ResponseBody
	public Map<String, Object> takeOrderInfo(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		TakeOrders takeOrder = takeOrdersService.findTakeOrderBytoId(id);

		if (takeOrder != null) {
			map.put("success", true);
			map.put("message", takeOrder);
		} else {
			map.put("success", false);
			map.put("message", "????????????");
		}

		return map;
	}

	@RequestMapping("updateTakeOrderInfo")
	@ResponseBody
	public Map<String, Object> updateTakeOrderInfo(TakeOrders takeOrders) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;
		row = takeOrdersService.updateTakeOrderInfo(takeOrders);

		if (row != 0) {
			map.put("success", true);
			map.put("message", "????????????");
		} else {
			map.put("success", false);
			map.put("message", "????????????");
		}

		return map;
	}

	@RequestMapping("orderList")
	public ModelAndView orderList() {

		ModelAndView modelAndView = new ModelAndView();

		List<Orders> orderList = ordersService.findAllOrderList();

		modelAndView.addObject("orderList", orderList);
		modelAndView.setViewName("admin/orderList");

		return modelAndView;
	}

	@RequestMapping("orderInfo")
	@ResponseBody
	public Map<String, Object> orderInfo(int id) {
		Map<String, Object> map = new HashMap<String, Object>();

		Orders order = ordersService.findById(id);

		if (order != null) {
			map.put("success", true);
			map.put("message", order);
		} else {
			map.put("success", false);
			map.put("message", "????????????");
		}

		return map;
	}

	@RequestMapping("updateOrderInfo")
	@ResponseBody
	public Map<String, Object> updateOrderInfo(int oId, String contactName,
			String contactPhone, String wxNumber, String remark) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;
		row = ordersService.updateOrderInfo(oId, contactName, contactPhone,
				wxNumber, remark);

		if (row != 0) {
			map.put("success", true);
			map.put("message", "????????????");
		} else {
			map.put("success", false);
			map.put("message", "????????????");
		}

		return map;
	}

	@RequestMapping("sendOrder")
	@ResponseBody
	public Map<String, Object> sendOrder(TakeOrders takeOrders,
			String teacherName) {
		Map<String, Object> map = new HashMap<String, Object>();

		map = takeOrdersService.sendOrder(takeOrders, teacherName);

		return map;
	}

	@RequestMapping("takeOrderInfoList")
	@ResponseBody
	public Map<String, Object> takeOrderInfoList(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		List<TakeOrders> takeOrderList = takeOrdersService
				.findTakeOrderListByOId(id);

		if (takeOrderList != null) {
			map.put("success", true);
			map.put("message", takeOrderList);

		} else {
			map.put("success", false);
			map.put("message", "????????????");

		}

		return map;
	}

	@RequestMapping("publishOrderPage")
	public ModelAndView publisherOrderPage() {

		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> dictList = dictInfoService.findByCode("jiudunianji");// ????????????
		List<DictInfo> dictInfoKeMuDaLeiList = dictInfoService
				.findByCode("kemudalei");// ????????????
		List<DictInfo> dictInfoKeMuXiaoLeiList = dictInfoService
				.findByCode("kemuxiaolei");// ????????????
		List<District> districtList = districtService.findAllDistrictList();

		List<Course> courseList = courseService.findAllCourseList();

		modelAndView.addObject("dictList", dictList);
		modelAndView.addObject("districtList", districtList);
		modelAndView.addObject("dictInfoKeMuDaLeiList", dictInfoKeMuDaLeiList);
		modelAndView.addObject("dictInfoKeMuXiaoLeiList",
				dictInfoKeMuXiaoLeiList);
		modelAndView.addObject("courseList", courseList);

		modelAndView.setViewName("admin/publishOrder");

		return modelAndView;
	}

	@RequestMapping("publishOrders")
	@ResponseBody
	public Map<String, Object> publishOrders(int memberId, int grade, int sex,
			String subjectids, String subjectnames, String teachdays,
			int areaid, String teachaddress, String contact, String telephone,
			int contactGender, String wexin, String sturemark,
			String teacherrequire, int coursePrice, int teachersex,
			String classmode, String teachertype, String lng, String lat) {

		Map<String, Object> map = new HashMap<String, Object>();

		int teachingCourse = Integer.parseInt(subjectids);// ????????????
		int teachingWay = 0;// ???????????? ???????????????????????????????????? ??????
		int teacherType = 0;// ??????????????????????????? ??????

		if (classmode.split(",").length == 2) {
			teachingWay = 0;// ???????????????????????????????????? ??????
		} else {
			teachingWay = Integer.parseInt(classmode);
		}

		if (teachertype.split(",").length == 2) {
			teacherType = 0;// ??????????????????????????? ??????
		} else {
			teacherType = Integer.parseInt(teachertype);
		}

		teachdays = teachdays.substring(0, teachdays.length() - 1);

		// 22 ????????????????????????
		map = ordersService.publishOrders(memberId, memberId, teachingCourse,
				contact, telephone, contactGender, wexin, sex, grade,
				sturemark, areaid, teachaddress, teachdays, coursePrice,
				teachingWay, teachersex, teacherType, teacherrequire, 22, lng,
				lat);

		return map;
	}

	@RequestMapping("paperList")
	public ModelAndView paperList(int degree) {
		ModelAndView modelAndView = new ModelAndView();

		List<Paper> paperList = paperService.findPaperByDegree(degree);

		modelAndView.addObject("paperList", paperList);
		modelAndView.setViewName("admin/paperList");

		return modelAndView;
	}

	@RequestMapping("stopPaper")
	@ResponseBody
	public Map<String, Object> stopPaper(int id) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = paperService.ChangePaperDisplay(id, 0);
		if (row == 1) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "???????????????");
		}

		return map;
	}

	@RequestMapping("startPaper")
	@ResponseBody
	public Map<String, Object> startPaper(int id) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = paperService.ChangePaperDisplay(id, 1);
		if (row == 1) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "???????????????");
		}

		return map;
	}

	@RequestMapping("paperInfo")
	public ModelAndView paperInfo(int pId) {
		ModelAndView modelAndView = new ModelAndView();

		Paper paper = paperService.findPaperInfo(pId);

		modelAndView.addObject("paper", paper);

		modelAndView.setViewName("admin/updatePaper");

		return modelAndView;
	}

	@RequestMapping("updatePaper")
	@ResponseBody
	public Map<String, Object> updatePaper(Paper paper) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = paperService.updatePaper(paper);

		if (row == 1) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "????????????");

		}

		return map;
	}

	@RequestMapping("preUpdateTeacher")
	public ModelAndView preUpdateTeacher(int tId) {

		ModelAndView modelAndView = new ModelAndView();

		Teacher teacher = teacherService.findByTeacherId(tId);

		List<DictInfo> dictInfoKeMuDaLeiList = dictInfoService
				.findByCode("kemudalei");// ????????????

		List<DictInfo> dictInfoKeMuXiaoLeiList = dictInfoService
				.findByCode("kemuxiaolei");// ????????????

		List<DictInfo> dictInfomuqianxueliList = dictInfoService
				.findByCode("muqianxuel");// ????????????

		List<DictInfo> dictInfoshenfenList = dictInfoService
				.findByCode("shenfen");// ??????

		List<District> districtList = districtService.findAllDistrictList();

		List<Course> courseList = courseService.findAllCourseList();

		modelAndView.addObject("districtList", districtList);
		modelAndView.addObject("dictInfoKeMuDaLeiList", dictInfoKeMuDaLeiList);
		modelAndView.addObject("dictInfomuqianxueliList",
				dictInfomuqianxueliList);
		modelAndView.addObject("dictInfoKeMuXiaoLeiList",
				dictInfoKeMuXiaoLeiList);
		modelAndView.addObject("dictInfoshenfenList", dictInfoshenfenList);
		modelAndView.addObject("courseList", courseList);

		modelAndView.addObject("teacher", teacher);
		modelAndView.setViewName("admin/updateTeacher");

		return modelAndView;
	}

	@RequestMapping("updateInfo")
	@ResponseBody
	public Map<String, Object> updateInfo(Teacher teacher) {

		Map<String, Object> map = new HashMap<String, Object>();

		map = teacherService.updateTeacher(teacher);

		return map;

	}

	@RequestMapping("pwdReset")
	@ResponseBody
	private Map<String, Object> pwdReset(int id) {

		// TODO ????????????????????????????????????

		Map<String, Object> map = new HashMap<String, Object>();

		String pwd = CommonUtil.getStringRandom(8);// ????????????8????????????
		System.out.println("????????????8????????????:" + pwd);

		map = teacherService.changePwd(MD5Utils.MD5(pwd), id);

		return map;
	}
	
	/*
	 * ??????spring??????????????????????????????
	 */
	@RequestMapping("personIDUpload.action")
	public String personIDUpload(HttpServletRequest request,
			HttpSession session) throws IllegalStateException, IOException {


		Map<String, Object> map = teacherService.PersonIDUpload(request,
				session);
		return "redirect:/admin/teacherList.action";

	}
}
