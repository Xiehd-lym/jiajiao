package com.jiajiao.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.jiajiao.bean.DictInfo;
import com.jiajiao.bean.Institution;
import com.jiajiao.service.DictInfoService;
import com.jiajiao.service.InstitutionService;

@Controller
@RequestMapping("institution")
public class InstitutionController {

	@Resource
	private InstitutionService institutionService;

	@Resource
	private DictInfoService dictInfoService;

	@RequestMapping("institutionPage")
	public ModelAndView institutionPage() {
		ModelAndView modelAndView = new ModelAndView();

		int display = 1;

		List<Institution> institutionList = institutionService.findAll(display);
		List<DictInfo> dictList = dictInfoService.findByCode("kemudalei");

		modelAndView.addObject("institutionList", institutionList);
		modelAndView.addObject("dictList", dictList);
		modelAndView.setViewName("institutions");

		return modelAndView;
	}

	@RequestMapping("institutionInfo")
	public ModelAndView institutionInfo(int iId,
			@RequestParam(defaultValue = "0") Integer admin) {
		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> dictList = dictInfoService.findByCode("kemudalei");
		Institution institution = institutionService.findByIid(iId);
		List<Institution> institutionList = institutionService
				.findTopThreeInstitution();

		institutionService.addViewNum(iId);

		modelAndView.addObject("institution", institution);
		modelAndView.addObject("institutionList", institutionList);
		modelAndView.addObject("dictList", dictList);

		if (admin == 1) {
			modelAndView.setViewName("../jsp/admin/institutionInfo");
		} else {

			modelAndView.setViewName("institutionInfo");
		}
		return modelAndView;
	}

	@RequestMapping("findInstitution")
	@ResponseBody
	public Map<String, Object> findInstitution(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		List<DictInfo> dictList = dictInfoService.findByCode("kemudalei");
		Institution institution = institutionService.findByIid(id);
		if (institution != null) {
			map.put("success", true);
			map.put("message", institution);
			map.put("dictList", dictList);
		} else {
			map.put("success", false);
			map.put("message", "????????????");
		}

		return map;
	}

	@RequestMapping("institutionList")
	public ModelAndView institutionList() {
		ModelAndView modelAndView = new ModelAndView();

		int display = -1;

		List<Institution> institutionList = institutionService.findAll(display);
		List<DictInfo> dictList = dictInfoService.findByCode("kemudalei");

		modelAndView.addObject("institutionList", institutionList);
		modelAndView.addObject("dictList", dictList);

		modelAndView.setViewName("admin/institutionList");

		return modelAndView;
	}

	@RequestMapping("stopInstitution")
	@ResponseBody
	public Map<String, Object> stopInstitution(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = institutionService.stopInstitution(id);

		if (row == 0) {
			map.put("success", false);
			map.put("message", "????????????");

		} else {
			map.put("success", true);
			map.put("message", "????????????");
		}

		return map;

	}

	@RequestMapping("startInstitution")
	@ResponseBody
	public Map<String, Object> startInstitution(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = institutionService.startInstitution(id);

		if (row == 0) {
			map.put("success", false);
			map.put("message", "????????????");

		} else {
			map.put("success", true);
			map.put("message", "????????????");
		}

		return map;

	}

	@RequestMapping("updateInstitution")
	public ModelAndView updateInstitution(HttpServletRequest request)
			throws IllegalStateException, IOException {

		ModelAndView modelAndView = new ModelAndView();

		institutionService.updateInstitution(request);

		modelAndView
				.setViewName("redirect:/institution/institutionList.action");

		return modelAndView;

	}

	@RequestMapping("uploadPhoto")
	@ResponseBody
	public Map<String, Object> uploadPhoto(HttpServletRequest request, int iId,
			HttpSession session) throws IllegalStateException, IOException {

		session.setAttribute("iId", iId);

		String photo = (String) session.getAttribute("photo");
		if (photo == null) {
			photo = "";
		}

		Map<String, Object> map = new HashMap<String, Object>();

		String path = null;// ????????????
		String type = null;// ????????????

		// ????????????????????????????????????????????????
		String realPath = request.getSession().getServletContext().getRealPath(
				"/");

		// ?????????????????????????????? CommonsMutipartResolver ????????????????????????
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());

		// ??????form????????????enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			// ???request???????????????request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// ??????multiRequest ?????????????????????
			Iterator<String> iter = multiRequest.getFileNames();

			while (iter.hasNext()) {
				// ????????????????????????
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());
				if (file != null) {

					long size = file.getSize();

					if (size > 5000000) {
						map.put("message", "??????????????????????????????5M?????????");
						return map;
					}

					String fileName = file.getOriginalFilename();// ???????????????

					// ??????????????????
					type = fileName.indexOf(".") != -1 ? fileName.substring(
							fileName.lastIndexOf(".") + 1, fileName.length())
							: null;

					if (type != null) {// ??????????????????????????????

						if ("GIF".equals(type.toUpperCase())
								|| "PNG".equals(type.toUpperCase())
								|| "JPG".equals(type.toUpperCase())) {

							// ????????????????????????
							String trueFileName = String.valueOf(System
									.currentTimeMillis())
									+ fileName;

							trueFileName = trueFileName.replace(",", "");

							if (trueFileName.length() > 150) {// ??????????????????

								trueFileName = trueFileName.substring(0, 13)
										+ trueFileName.substring(trueFileName
												.length() - 10, trueFileName
												.length());
							}

							/* System.getProperty("file.separator")+ */
							// ?????????????????????????????????
							path = realPath + "static/institutionimg/"
									+ trueFileName;

							// ??????????????????????????????
							file.transferTo(new File(path));
							photo = photo + trueFileName + ",";
							session.setAttribute("photo", photo);
							map.put("?????????", fileName + "???????????????");

						}

					}
				}
			}
		}

		return map;
	}

	@RequestMapping("updateInstitutionPhoto")
	public Map<String, Object> updateInstitutionPhoto(
			HttpServletRequest request, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		String photo = (String) session.getAttribute("photo");

		Integer iId = (Integer) session.getAttribute("iId");

		Institution institution = institutionService.findByIid(iId);

		int row = institutionService.updatePhoto(iId, photo);

		if (row != 0) {

			// ????????????????????????
			// ?????????????????????????????????
			String[] photos = institution.getPhoto().split(",");

			// ????????????????????????????????????????????????
			String realPath = request.getSession().getServletContext()
					.getRealPath("/");

			for (int i = 0; i < photos.length; i++) {
				String path = realPath + "static/institutionimg/" + photos[i];
				new File(path).delete();
			}
			map.put("message", "???????????????");
		} else {
			map.put("message", "???????????????");
		}

		session.removeAttribute("photo");
		session.removeAttribute("iId");

		return map;
	}

	@RequestMapping("pubInstitutionPage")
	public ModelAndView pubInstitutionPage() {
		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> dictList = dictInfoService.findByCode("kemudalei");

		modelAndView.addObject("dictList", dictList);
		modelAndView.setViewName("admin/publishInstitution");
		return modelAndView;
	}

	@RequestMapping("pubInstitution")
	public ModelAndView pubInstitution(HttpServletRequest request)
			throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView();

		Map<String, Object> map = institutionService
				.pubInstitutionInfo(request);

		// TODO
		// modelAndView.addObject("dictList", dictList);
		// modelAndView.setViewName("admin/publishInstitution");
		return modelAndView;
	}

	@RequestMapping("mInstitutionList")
	public ModelAndView mInstitutionList() {
		ModelAndView modelAndView = new ModelAndView();

		int display = 1;

		List<Institution> institutionList = institutionService.findAll(display);
		List<DictInfo> dictList = dictInfoService.findByCode("kemudalei");

		modelAndView.addObject("institutionList", institutionList);
		modelAndView.addObject("dictList", dictList);
		modelAndView.setViewName("mobile/institutionList");

		return modelAndView;
	}

	@RequestMapping("mInstitutionInfo")
	public ModelAndView mInstitutionInfo(int id) {
		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> dictList = dictInfoService.findByCode("kemudalei");
		Institution institution = institutionService.findByIid(id);

		institutionService.addViewNum(id);

		modelAndView.addObject("institution", institution);
		modelAndView.addObject("dictList", dictList);

		modelAndView.setViewName("mobile/institutionInfo");
		return modelAndView;
	}
}
