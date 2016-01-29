package com.lawsuit.wsla.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.dao.hibernate.BaseHibernateDao;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.lawsuit.wsla.dao.CourtDao;
import com.lawsuit.wsla.entity.CourtOpenInfo;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class CourtOpenInfoService {
	@Autowired
	private CourtDao courtDao;
	@Autowired
	private BaseHibernateDao baseHibernateDao;

	/**
	 * 
	 * @param fileAbsolutePath
	 * @return retCode: 0:成功；-1：sheet1为空；-2:异常
	 * @throws Exception
	 */
	public int invokeTask(String fileAbsolutePath,String organization) throws Exception {

		HSSFSheet sheet = null;
		HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(
				fileAbsolutePath)); // 获整个Excel
		sheet = workbook.getSheetAt(0);// 只获取第一个sheet页，也就是sheet1
		List<CourtOpenInfo> list = new ArrayList<CourtOpenInfo>();
		try {
			if (sheet == null) {
				return -1;
			} else {
				int lastRowNum = sheet.getLastRowNum(); // 最后一行
				for (int rowNum = 1; rowNum <= lastRowNum; rowNum++) {
					if (sheet.getRow(rowNum) != null) {// 如果行不为空
						HSSFRow row = sheet.getRow(rowNum);
						Cell hc = row.getCell(1);//获取案号单元格，判断非空
						if (hc == null || hc.getCellType() == HSSFCell.CELL_TYPE_BLANK) {
						    continue;
						}else{
							CourtOpenInfo courtOpenInfo = new CourtOpenInfo();// 创建对象
							short firstCellNum = row.getFirstCellNum(); // 该行的第一个单元格
							// short lastCellNum = row.getLastCellNum(); //
							// 该行的最后一个单元格
							for (short cellNum = firstCellNum; cellNum <= 6; cellNum++) { // 循环该行的每一个单元格
								HSSFCell cell = row.getCell(cellNum);

								setCourtInfoValue(cellNum, getCellValue(cell)
										.toString(), courtOpenInfo);
							}
								courtOpenInfo.setOrganization(organization);
								list.add(courtOpenInfo);
						}
						
					} else {
						continue;
					}
				}
			}
		} catch (Exception e) {
			return -2;
		}
		initTableData();
		for (CourtOpenInfo courtOpenInfo : list) {
			courtDao.saveCourtOpenInfo(courtOpenInfo);
		}
		return 0;

	}
	/**
	 * 取得单元格的值
	 * 
	 * @param cell
	 * @return
	 * @throws IOException
	 */
	private static Object getCellValue(HSSFCell cell) throws IOException {
		Object value = "";
		if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
			value = cell.getRichStringCellValue().toString();
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				Date date = cell.getDateCellValue();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				value = sdf.format(date);
			} else {
				double valueTemp = (double) cell.getNumericCellValue();
				BigDecimal bd = new BigDecimal(valueTemp);
				BigDecimal bd1 = bd.setScale(3, bd.ROUND_HALF_UP);
				value = bd1.doubleValue();

				/*
				 * DecimalFormat format = new DecimalFormat("#0.###"); value =
				 * format.format(cell.getNumericCellValue());
				 */
			}
		}
		if (cell.getCellType() == HSSFCell.CELL_TYPE_BLANK) {
			value = "";
		}
		return value;
	}

	/**
	 * 设置变量值
	 * 
	 * @param cellNum
	 * @param cellValue
	 * @param courtOpenInfo
	 */
	private static void setCourtInfoValue(short cellNum, String cellValue,
			CourtOpenInfo courtOpenInfo) {
		switch (cellNum) {
		case 1:
			courtOpenInfo.setCaseNum(cellValue);
			break;
		case 2:
			courtOpenInfo.setCaseName(cellValue);
			break;
		case 3:
			courtOpenInfo.setChiefJudge(cellValue);
			break;
		case 4:
			courtOpenInfo.setViceJudges(cellValue);
			break;
		case 5:
			courtOpenInfo.setCourtPlace(cellValue);
			break;
		default:
			courtOpenInfo.setStartTime(cellValue);
			break;
		}

	}

	/**
	 * 
	 * @return retCode : 0 成功；-1 失败
	 */
	public int initTableData() {
		// String sql = "truncate CourtOpenInfo";
		// HqlBuilder hqlBuilder = new HqlBuilder(sql);
		String hql = "delete from CourtOpenInfo where 1=1";
		HqlBuilder hqlBuilder = new HqlBuilder(hql);
		try {
			baseHibernateDao.batch(hqlBuilder);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		return 0;
	}
	
	
	public List<CourtOpenInfo> getCourtOpenInfoList(){
		return courtDao.getCourtOpenInfoList();
	}
	public Page findPage(Page page,String requestNameSpace){
		return courtDao.findPage(page,requestNameSpace);
		
	}
}
