package com.pan.competition.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableCell.XWPFVertAlign;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPRow;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.pan.competition.bean.ApplyReport;
import com.pan.competition.bean.GradeReport;
import com.pan.competition.bean.OrderReport;
import com.pan.competition.bean.RankingReport;
import com.pan.competition.config.Constant;
import com.pan.competition.service.ReportService;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String report_type = request.getParameter("type");
		String id = request.getParameter("id");
		String format = request.getParameter("format");
		ReportService reportService = new ReportService();
		boolean result = false;
		String report_name = null;
    	if(Constant.EVENT_APPLY_REPORT.equals(report_type)) {
			List<ApplyReport> applyReports = reportService.getApplyReportList(id);
			if("pdf".equals(format)) 
				result = createEventApplyPdfReport(applyReports);
			else
				result = createEventApplyWordReport(applyReports);
			if(result)
				report_name = applyReports.get(0).getReport_name();
		}else if(Constant.DELEGATION_APPLY_REPORT.equals(report_type)) {
			List<ApplyReport> applyReports = reportService.getDelegationApplyReportList(id);
			if("pdf".equals(format)) 
				result = createDelegationApplyPdfReport(applyReports);
			else
				result = createDelegationApplyWordReport(applyReports);
			if(result)
				report_name = applyReports.get(0).getReport_name();
		}else if(Constant.ORDER_REPORT.equals(report_type)) {
			List<OrderReport> orderReports = reportService.getOrderReportList(id);
			if("pdf".equals(format)) 
				result = createOrderPdfReport(orderReports);
			else
				result = createOrderWordReport(orderReports);
			if(result)
				report_name = orderReports.get(0).getReport_name();
		}else if(Constant.GRADE_REPORT.equals(report_type)) {
			List<GradeReport> gradeReports = reportService.getGradeReportList(id);
			if("pdf".equals(format)) 
				result = createGradePdfReport(gradeReports);
			else
				result = createGradeWordReport(gradeReports);
			if(result)
				report_name = gradeReports.get(0).getReport_name();
		}else if(Constant.RANKING_REPORT.equals(report_type)) {
			List<RankingReport> rankingReports = reportService.getRankingReportList(id);
			if("pdf".equals(format)) 
				result = createRankingPdfReport(rankingReports);
			else
				result = createRankingWordReport(rankingReports);
			if(result)
				report_name = rankingReports.get(0).getReport_name();
		}
    	if(result)
    		download(request,response,report_name);
    	else {
    		/*request.setCharacterEncoding("UTF-8");
    		response.setCharacterEncoding("UTF-8");
    		PrintWriter out = response.getWriter();
    	    out.write("<script>alert('报表内容为空')</script>");
    	    out.flush();
    	    out.close();*/
    	}
	}
	
    public void download(HttpServletRequest request,  HttpServletResponse response,String report_name) throws IOException {    
        String format = request.getParameter("format");
        //获取服务器端文件保存路径    
        String path;  
        if("pdf".equals(format))
        	path = "table.pdf";
        else
        	path = "table.docx";
        //下载  
        try {  
            // path是指欲下载的文件的路径。  
            File file = new File(path);  
           
            // 以流的形式下载文件。  
            InputStream fis = new BufferedInputStream(new FileInputStream(path));  
            byte[] buffer = new byte[fis.available()];  
            fis.read(buffer);  
            fis.close();  
            // 清空response  
            response.reset();  
            if("pdf".equals(format))
            	response.addHeader("Content-Disposition", "attachment;filename=" + new String((report_name+".pdf").getBytes("gb2312"),"ISO8859-1"));  
            else
            	response.addHeader("Content-Disposition", "attachment;filename=" + new String((report_name+".docx").getBytes("gb2312"),"ISO8859-1"));  
            response.addHeader("Content-Length", "" + file.length());  
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());  
            response.setContentType("application/octet-stream");  
            toClient.write(buffer);  
            toClient.flush();  
            toClient.close();  
        } catch (IOException ex) {  
            ex.printStackTrace();  
        }  
      
    } 
    
    @SuppressWarnings("resource")
	private boolean createEventApplyWordReport(List<ApplyReport> applyReports) throws IOException {
    	if(applyReports.size()==0) 
 	       return false;
    	//Blank Document  
        XWPFDocument document= new XWPFDocument();  
  
        FileOutputStream out = new FileOutputStream(new File("table.docx"));
  
        //添加标题 
        XWPFParagraph titleParagraph = document.createParagraph();  
        //设置段落居中  
        titleParagraph.setAlignment(ParagraphAlignment.CENTER);  
  
        XWPFRun titleParagraphRun = titleParagraph.createRun();  
        titleParagraphRun.setText(applyReports.get(0).getReport_name());  
        titleParagraphRun.setColor("000000");  
        titleParagraphRun.setFontSize(16);  
        titleParagraphRun.setText("\r");  

        //工作经历表格  
        XWPFTable ComTable = document.createTable();    
  
        //列宽自动分割  
        CTTblWidth comTableWidth = ComTable.getCTTbl().addNewTblPr().addNewTblW();  
        comTableWidth.setType(STTblWidth.DXA);  
        comTableWidth.setW(BigInteger.valueOf(9072)); 

        XWPFParagraph p = document.createParagraph(); 
        //表格第一行  
        XWPFTableRow comTableRowOne = ComTable.getRow(0); 
        setCell(comTableRowOne.getCell(0),"报项名",p);
        //comTableRowOne.getCell(0).setColor("F4F4F4");  //设置表格颜色
        setCell(comTableRowOne.addNewTableCell(),"代表团",p);
        //comTableRowOne.getCell(1).setColor("F4F4F4");
        setCell(comTableRowOne.addNewTableCell(),"运动员",p);
        //comTableRowOne.getCell(2).setColor("F4F4F4"); 
        setCell(comTableRowOne.addNewTableCell(),"介绍",p);
       // comTableRowOne.getCell(3).setColor("F4F4F4");
        
       for(ApplyReport applyReport : applyReports) {
	        XWPFTableRow comTableRow = ComTable.createRow(); 
	        setCell(comTableRow.getCell(0),applyReport.getApply_name(),p);
	        setCell(comTableRow.getCell(1),applyReport.getDelegation_name(),p);
	        setCell(comTableRow.getCell(2),applyReport.getAthlets(),p);
	        setCell(comTableRow.getCell(3),applyReport.getRemark(),p); 
        }
       /* CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();  
        XWPFHeaderFooterPolicy policy = new XWPFHeaderFooterPolicy(document, sectPr);  
  
        //添加页眉  
        CTP ctpHeader = CTP.Factory.newInstance();  
        CTR ctrHeader = ctpHeader.addNewR();  
        CTText ctHeader = ctrHeader.addNewT();  
        String headerText = "Java POI create MS word file.";  
        ctHeader.setStringValue(headerText);  
        XWPFParagraph headerParagraph = new XWPFParagraph(ctpHeader, document);  
        //设置为右对齐  
        headerParagraph.setAlignment(ParagraphAlignment.RIGHT);  
        XWPFParagraph[] parsHeader = new XWPFParagraph[1];  
        parsHeader[0] = headerParagraph;  
        policy.createHeader(XWPFHeaderFooterPolicy.DEFAULT, parsHeader);  
        
  
        //添加页脚  
        CTP ctpFooter = CTP.Factory.newInstance();  
        CTR ctrFooter = ctpFooter.addNewR();  
        CTText ctFooter = ctrFooter.addNewT();  
        String footerText = "http://blog.csdn.net/zhouseawater";  
        ctFooter.setStringValue(footerText); 
        
        XWPFParagraph footerParagraph = new XWPFParagraph(ctpFooter, document);  
        headerParagraph.setAlignment(ParagraphAlignment.CENTER);  
        XWPFParagraph[] parsFooter = new XWPFParagraph[1];  
        parsFooter[0] = footerParagraph;  
        policy.createFooter(XWPFHeaderFooterPolicy.DEFAULT, parsFooter);  
  */
        document.write(out);  
        out.close();  
        return true;
    }
    
  //设置表格内容及对齐方式
    private void setCell(XWPFTableCell cell,String text,XWPFParagraph p){
      if(cell.getParagraphs().size()>0){
              p=cell.getParagraphs().get(0);
     }else{
             p=cell.addParagraph();
     }
     XWPFRun pRun=p.createRun();
     pRun.setText(text);
     //垂直居中
     cell.setVerticalAlignment(XWPFVertAlign.CENTER);
     //水平居中
     p.setAlignment(ParagraphAlignment.CENTER);

  }
    
    @SuppressWarnings("resource")
	private boolean createDelegationApplyWordReport(List<ApplyReport> applyReports) throws IOException {
    	if(applyReports.size()==0) 
 	       return false;
    	//Blank Document  
        XWPFDocument document= new XWPFDocument();  
  
        FileOutputStream out = new FileOutputStream(new File("table.docx"));
  
        //添加标题 
        XWPFParagraph titleParagraph = document.createParagraph();  
        //设置段落居中  
        titleParagraph.setAlignment(ParagraphAlignment.CENTER);  
  
        XWPFRun titleParagraphRun = titleParagraph.createRun();  
        titleParagraphRun.setText(applyReports.get(0).getReport_name());  
        titleParagraphRun.setColor("000000");  
        titleParagraphRun.setFontSize(16);  
        titleParagraphRun.setText("\r");  

        //工作经历表格  
        XWPFTable ComTable = document.createTable();        
        
        //列宽自动分割  
        CTTblWidth comTableWidth = ComTable.getCTTbl().addNewTblPr().addNewTblW();  
        comTableWidth.setType(STTblWidth.DXA);  
        comTableWidth.setW(BigInteger.valueOf(9072)); 
        
        XWPFParagraph p = document.createParagraph();
        
        //表格第一行  
        XWPFTableRow comTableRowOne = ComTable.getRow(0); 
        setCell(comTableRowOne.getCell(0),"项目",p);
        setCell(comTableRowOne.addNewTableCell(),"报项名",p);
        setCell(comTableRowOne.addNewTableCell(),"运动员",p);
        setCell(comTableRowOne.addNewTableCell(),"介绍",p);
  
       for(ApplyReport applyReport : applyReports) {
	        XWPFTableRow comTableRow = ComTable.createRow();  
	        setCell(comTableRow.getCell(0),applyReport.getEvent_name(),p);
	        setCell(comTableRow.getCell(1),applyReport.getApply_name(),p);
	        setCell(comTableRow.getCell(2),applyReport.getAthlets(),p);
	        setCell(comTableRow.getCell(3),applyReport.getRemark(),p);
        }
      
        document.write(out);  
        out.close();  
        return true;
    }
    
    @SuppressWarnings("resource")
   	private boolean createOrderWordReport(List<OrderReport> orderReports) throws IOException {
       	if(orderReports.size()<=0) 
    	       return false;
       	//Blank Document  
           XWPFDocument document= new XWPFDocument();  
     
           FileOutputStream out = new FileOutputStream(new File("table.docx"));
     
           //添加标题 
           XWPFParagraph titleParagraph = document.createParagraph();  
           //设置段落居中  
           titleParagraph.setAlignment(ParagraphAlignment.CENTER);  
     
           XWPFRun titleParagraphRun = titleParagraph.createRun();  
           titleParagraphRun.setText(orderReports.get(0).getReport_name());  
           titleParagraphRun.setColor("000000");  
           titleParagraphRun.setFontSize(16);  
           titleParagraphRun.setText("\r");  

           //工作经历表格  
           XWPFTable ComTable = document.createTable();        
           
           //列宽自动分割  
           CTTblWidth comTableWidth = ComTable.getCTTbl().addNewTblPr().addNewTblW();  
           comTableWidth.setType(STTblWidth.DXA);  
           comTableWidth.setW(BigInteger.valueOf(9072)); 
           
           XWPFParagraph p = document.createParagraph();
           
           //表格第一行  
           XWPFTableRow comTableRowOne = ComTable.getRow(0); 
           setCell(comTableRowOne.getCell(0),"分组",p);
           setCell(comTableRowOne.addNewTableCell(),"出场顺序",p);
           setCell(comTableRowOne.addNewTableCell(),"报项名",p);
           setCell(comTableRowOne.addNewTableCell(),"代表团",p);
     
          for(OrderReport orderReport : orderReports) {
   	        XWPFTableRow comTableRow = ComTable.createRow();  
   	        setCell(comTableRow.getCell(0),orderReport.getGroup_num(),p);
   	        setCell(comTableRow.getCell(1),orderReport.getOrder(),p);
   	        setCell(comTableRow.getCell(2),orderReport.getApply_name(),p);
   	        setCell(comTableRow.getCell(3),orderReport.getDelegation_name(),p);
           }
         
           document.write(out);  
           out.close();  
           return true;
       }
    
    @SuppressWarnings("resource")
   	private boolean createGradeWordReport(List<GradeReport> gradeReports) throws IOException {
       	if(gradeReports.size()<=0) 
    	       return false;
       	//Blank Document  
           XWPFDocument document= new XWPFDocument();  
     
           FileOutputStream out = new FileOutputStream(new File("table.docx"));
     
           //添加标题 
           XWPFParagraph titleParagraph = document.createParagraph();  
           //设置段落居中  
           titleParagraph.setAlignment(ParagraphAlignment.CENTER);  
     
           XWPFRun titleParagraphRun = titleParagraph.createRun();  
           titleParagraphRun.setText(gradeReports.get(0).getReport_name());  
           titleParagraphRun.setColor("000000");  
           titleParagraphRun.setFontSize(16);  
           titleParagraphRun.setText("\r");  

           //工作经历表格  
           XWPFTable ComTable = document.createTable();        
           
           //列宽自动分割  
           CTTblWidth comTableWidth = ComTable.getCTTbl().addNewTblPr().addNewTblW();  
           comTableWidth.setType(STTblWidth.DXA);  
           comTableWidth.setW(BigInteger.valueOf(9072)); 
           
           XWPFParagraph p = document.createParagraph();
           
           //表格第一行  
           XWPFTableRow comTableRowOne = ComTable.getRow(0); 
           setCell(comTableRowOne.getCell(0),"报项名",p);
           setCell(comTableRowOne.addNewTableCell(),"代表团",p);
           setCell(comTableRowOne.addNewTableCell(),"动作质量得分",p);
           setCell(comTableRowOne.addNewTableCell(),"难度得分",p);
           setCell(comTableRowOne.addNewTableCell(),"演练水平得分",p);
           setCell(comTableRowOne.addNewTableCell(),"裁判长",p);
           setCell(comTableRowOne.addNewTableCell(),"总分",p);
           setCell(comTableRowOne.addNewTableCell(),"名次",p);
           setCell(comTableRowOne.addNewTableCell(),"晋级",p);
     
          for(GradeReport gradeReport : gradeReports) {
	   	        XWPFTableRow comTableRow = ComTable.createRow();  
	   	        setCell(comTableRow.getCell(0),gradeReport.getApply_name(),p);
	   	        setCell(comTableRow.getCell(1),gradeReport.getDelegation_name(),p);
	   	        setCell(comTableRow.getCell(2),gradeReport.getGradeA(),p);
	   	        setCell(comTableRow.getCell(3),gradeReport.getGradeB(),p);
	   	        setCell(comTableRow.getCell(4),gradeReport.getGradeC(),p);
	   	        setCell(comTableRow.getCell(5),gradeReport.getCoach_grade(),p);
	   	        setCell(comTableRow.getCell(6),gradeReport.getTotal_points(),p);
	   	        setCell(comTableRow.getCell(7),gradeReport.getRanking(),p);
	   	        setCell(comTableRow.getCell(8),gradeReport.getPromote(),p);
           }
           document.write(out);  
           out.close();  
           return true;
       }
    
    @SuppressWarnings("resource")
   	private boolean createRankingWordReport(List<RankingReport> rankingReports) throws IOException {
       	if(rankingReports.size()<=0) 
    	       return false;
       	//Blank Document  
           XWPFDocument document= new XWPFDocument();  
     
           FileOutputStream out = new FileOutputStream(new File("table.docx"));
     
           //添加标题 
           XWPFParagraph titleParagraph = document.createParagraph();  
           //设置段落居中  
           titleParagraph.setAlignment(ParagraphAlignment.CENTER);  
     
           XWPFRun titleParagraphRun = titleParagraph.createRun();  
           titleParagraphRun.setText(rankingReports.get(0).getReport_name());  
           titleParagraphRun.setColor("000000");  
           titleParagraphRun.setFontSize(16);  
           titleParagraphRun.setText("\r");  

           //工作经历表格  
           XWPFTable ComTable = document.createTable();        
           
           //列宽自动分割  
           CTTblWidth comTableWidth = ComTable.getCTTbl().addNewTblPr().addNewTblW();  
           comTableWidth.setType(STTblWidth.DXA);  
           comTableWidth.setW(BigInteger.valueOf(9072)); 
           
           XWPFParagraph p = document.createParagraph();
           
           //表格第一行  
           XWPFTableRow comTableRowOne = ComTable.getRow(0); 
           setCell(comTableRowOne.getCell(0),"报项名",p);
           setCell(comTableRowOne.addNewTableCell(),"代表团",p);
           for(String stage_name : rankingReports.get(0).getStage_name())
        	   setCell(comTableRowOne.addNewTableCell(),stage_name,p);
           setCell(comTableRowOne.addNewTableCell(),"名次",p);
     
          for(RankingReport rankingReport : rankingReports) {
   	        XWPFTableRow comTableRow = ComTable.createRow();  
   	        setCell(comTableRow.getCell(0),rankingReport.getApply_name(),p);
   	        setCell(comTableRow.getCell(1),rankingReport.getDelegation_name(),p);
   	        int i = 2;
	   	    for(String stage_grade : rankingReport.getStage_grade())
	      	   setCell(comTableRow.getCell(i++),stage_grade,p);
	   	    setCell(comTableRow.getCell(i++),rankingReport.getRanking(),p);
          }
           document.write(out);  
           out.close();  
           return true;
       }
  
    private boolean createEventApplyPdfReport(List<ApplyReport> applyReports) throws IOException {
    	if(applyReports.size()<=0)
    		return false;
    	//创建文件
        Document document = new Document();
		try { 
			  BaseFont baseFont = BaseFont.createFont("STSONG.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);//创建一个支持中文的字体
			  Font title = new Font(baseFont, 16, Font.NORMAL);
			  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("table.pdf"));
			  //打开文件
		       document.open();
		       Paragraph paragraph = new Paragraph(applyReports.get(0).getReport_name(),title);
		       paragraph.setAlignment(Element.ALIGN_CENTER);
		       document.add(paragraph);
		    
		       PdfPTable table = new PdfPTable(4); 
		       table.setWidthPercentage(100); // 宽度100%填充
		       table.setSpacingBefore(10f); // 前间距
		       table.setSpacingAfter(10f); // 后间距

		       List<PdfPRow> listRow = table.getRows();
		       //设置列宽
		       float[] columnWidths = { 1f, 1f, 2f,2f };
		       table.setWidths(columnWidths);
		       
		       //行1
		       PdfPCell cells1[]= new PdfPCell[4];
		       PdfPRow row1 = new PdfPRow(cells1);
		       Font tabletitle = new Font(baseFont, 11, Font.BOLD);
		       //单元格
		       cells1[0] = new PdfPCell(new Paragraph("报项名",tabletitle));//单元格内容
		       cells1[0].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[1] = new PdfPCell(new Paragraph("代表团",tabletitle));
		       cells1[1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[2] = new PdfPCell(new Paragraph("运动员",tabletitle));
		       cells1[2].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[3] = new PdfPCell(new Paragraph("介绍",tabletitle));
		       cells1[3].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       listRow.add(row1);    
		       
		       Font content = new Font(baseFont, 11, Font.NORMAL);
		       for(ApplyReport applyReport :applyReports) {
			       PdfPCell cells[]= new PdfPCell[4];
			       PdfPRow row = new PdfPRow(cells);
			       cells[0] = new PdfPCell(new Paragraph(applyReport.getApply_name(),content));
			       cells[0].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[1] = new PdfPCell(new Paragraph(applyReport.getDelegation_name(),content));
			       cells[1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[2] = new PdfPCell(new Paragraph(applyReport.getAthlets(),content));
			       cells[2].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[3] = new PdfPCell(new Paragraph(applyReport.getRemark(),content));
			       cells[3].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       listRow.add(row);
		       }
		      //把表格添加到文件中
		       document.add(table);
		       //关闭文档
		      document.close();
		       //关闭书写器
		      writer.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
      return true;
    }
    
    private boolean createDelegationApplyPdfReport(List<ApplyReport> applyReports) throws IOException {
    	if(applyReports.size()<=0)
    		return false;
    	//创建文件
        Document document = new Document();
		try { 
			  BaseFont baseFont = BaseFont.createFont("STSONG.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);//创建一个支持中文的字体
			  Font title = new Font(baseFont, 16, Font.NORMAL);
			  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("table.pdf"));
			  //打开文件
		       document.open();
		       Paragraph paragraph = new Paragraph(applyReports.get(0).getReport_name(),title);
		       paragraph.setAlignment(Element.ALIGN_CENTER);
		       document.add(paragraph);
		    
		       PdfPTable table = new PdfPTable(4); 
		       table.setWidthPercentage(100); // 宽度100%填充
		       table.setSpacingBefore(10f); // 前间距
		       table.setSpacingAfter(10f); // 后间距

		       List<PdfPRow> listRow = table.getRows();
		       //设置列宽
		       float[] columnWidths = { 1f, 1f, 2f,2f };
		       table.setWidths(columnWidths);
		       
		       //行1
		       PdfPCell cells1[]= new PdfPCell[4];
		       PdfPRow row1 = new PdfPRow(cells1);
		       Font tabletitle = new Font(baseFont, 11, Font.BOLD);
		       //单元格
		       cells1[0] = new PdfPCell(new Paragraph("项目名",tabletitle));//单元格内容
		       cells1[0].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[1] = new PdfPCell(new Paragraph("报项名",tabletitle));
		       cells1[1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[2] = new PdfPCell(new Paragraph("运动员",tabletitle));
		       cells1[2].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[3] = new PdfPCell(new Paragraph("介绍",tabletitle));
		       cells1[3].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       listRow.add(row1);    
		       
		       Font content = new Font(baseFont, 11, Font.NORMAL);
		       for(ApplyReport applyReport :applyReports) {
			       PdfPCell cells[]= new PdfPCell[4];
			       PdfPRow row = new PdfPRow(cells);
			       cells[0] = new PdfPCell(new Paragraph(applyReport.getEvent_name(),content));
			       cells[0].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[1] = new PdfPCell(new Paragraph(applyReport.getApply_name(),content));
			       cells[1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[2] = new PdfPCell(new Paragraph(applyReport.getAthlets(),content));
			       cells[2].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[3] = new PdfPCell(new Paragraph(applyReport.getRemark(),content));
			       cells[3].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       listRow.add(row);
		       }
		      //把表格添加到文件中
		       document.add(table);
		       //关闭文档
		      document.close();
		       //关闭书写器
		      writer.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
      return true;
    }
    
    private boolean createOrderPdfReport(List<OrderReport> orderReports) throws IOException {
    	if(orderReports.size()<=0)
    		return false;
    	//创建文件
        Document document = new Document();
		try { 
			  BaseFont baseFont = BaseFont.createFont("STSONG.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);//创建一个支持中文的字体
			  Font title = new Font(baseFont, 16, Font.NORMAL);
			  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("table.pdf"));
			  //打开文件
		       document.open();
		       Paragraph paragraph = new Paragraph(orderReports.get(0).getReport_name(),title);
		       paragraph.setAlignment(Element.ALIGN_CENTER);
		       document.add(paragraph);
		    
		       PdfPTable table = new PdfPTable(4); 
		       table.setWidthPercentage(100); // 宽度100%填充
		       table.setSpacingBefore(10f); // 前间距
		       table.setSpacingAfter(10f); // 后间距

		       List<PdfPRow> listRow = table.getRows();
		       //设置列宽
		       float[] columnWidths = { 1f, 1f, 2f,2f };
		       table.setWidths(columnWidths);
		       
		       //行1
		       PdfPCell cells1[]= new PdfPCell[4];
		       PdfPRow row1 = new PdfPRow(cells1);
		       Font tabletitle = new Font(baseFont, 11, Font.BOLD);
		       //单元格
		       cells1[0] = new PdfPCell(new Paragraph("分组",tabletitle));//单元格内容
		       cells1[0].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[1] = new PdfPCell(new Paragraph("出场顺序",tabletitle));
		       cells1[1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[2] = new PdfPCell(new Paragraph("报项名",tabletitle));
		       cells1[2].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[3] = new PdfPCell(new Paragraph("代表团",tabletitle));
		       cells1[3].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       listRow.add(row1);    
		       
		       Font content = new Font(baseFont, 11, Font.NORMAL);
		       for(OrderReport orderReport :orderReports) {
			       PdfPCell cells[]= new PdfPCell[4];
			       PdfPRow row = new PdfPRow(cells);
			       cells[0] = new PdfPCell(new Paragraph(orderReport.getGroup_num(),content));
			       cells[0].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[1] = new PdfPCell(new Paragraph(orderReport.getOrder(),content));
			       cells[1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[2] = new PdfPCell(new Paragraph(orderReport.getApply_name(),content));
			       cells[2].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[3] = new PdfPCell(new Paragraph(orderReport.getDelegation_name(),content));
			       cells[3].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       listRow.add(row);
		       }
		      //把表格添加到文件中
		       document.add(table);
		       //关闭文档
		      document.close();
		       //关闭书写器
		      writer.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
      return true;
    }
    
    private boolean createGradePdfReport(List<GradeReport> gradeReports) throws IOException {
    	if(gradeReports.size()<=0)
    		return false;
    	//创建文件
        Document document = new Document();
		try { 
			  BaseFont baseFont = BaseFont.createFont("STSONG.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);//创建一个支持中文的字体
			  Font title = new Font(baseFont, 16, Font.NORMAL);
			  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("table.pdf"));
			  //打开文件
		       document.open();
		       Paragraph paragraph = new Paragraph(gradeReports.get(0).getReport_name(),title);
		       paragraph.setAlignment(Element.ALIGN_CENTER);
		       document.add(paragraph);
		    
		       PdfPTable table = new PdfPTable(9); 
		       table.setWidthPercentage(100); // 宽度100%填充
		       table.setSpacingBefore(10f); // 前间距
		       table.setSpacingAfter(10f); // 后间距

		       List<PdfPRow> listRow = table.getRows();
		       //设置列宽
		       float[] columnWidths = { 2f, 2f, 1f,1f,1f,1f,1f,1f,1f };
		       table.setWidths(columnWidths);
		       
		       //行1
		       PdfPCell cells1[]= new PdfPCell[9];
		       PdfPRow row1 = new PdfPRow(cells1);
		       Font tabletitle = new Font(baseFont, 11, Font.BOLD);
		       //单元格
		       cells1[0] = new PdfPCell(new Paragraph("报项名",tabletitle));//单元格内容
		       cells1[0].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[1] = new PdfPCell(new Paragraph("代表团",tabletitle));
		       cells1[1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[2] = new PdfPCell(new Paragraph("动作质量得分",tabletitle));
		       cells1[2].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[3] = new PdfPCell(new Paragraph("难度得分",tabletitle));
		       cells1[3].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[4] = new PdfPCell(new Paragraph("演练水平得分",tabletitle));
		       cells1[4].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[5] = new PdfPCell(new Paragraph("裁判长",tabletitle));
		       cells1[5].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[6] = new PdfPCell(new Paragraph("总分",tabletitle));
		       cells1[6].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[7] = new PdfPCell(new Paragraph("名次",tabletitle));
		       cells1[7].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[8] = new PdfPCell(new Paragraph("晋级",tabletitle));
		       cells1[8].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       listRow.add(row1);    
		       
		       Font content = new Font(baseFont, 11, Font.NORMAL);
		       for(GradeReport gradeReport :gradeReports) {
			       PdfPCell cells[]= new PdfPCell[9];
			       PdfPRow row = new PdfPRow(cells);
			       cells[0] = new PdfPCell(new Paragraph(gradeReport.getApply_name(),content));
			       cells[0].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[1] = new PdfPCell(new Paragraph(gradeReport.getDelegation_name(),content));
			       cells[1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[2] = new PdfPCell(new Paragraph(gradeReport.getGradeA(),content));
			       cells[2].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[3] = new PdfPCell(new Paragraph(gradeReport.getGradeB(),content));
			       cells[3].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[4] = new PdfPCell(new Paragraph(gradeReport.getGradeC(),content));
			       cells[4].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[5] = new PdfPCell(new Paragraph(gradeReport.getCoach_grade(),content));
			       cells[5].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[6] = new PdfPCell(new Paragraph(gradeReport.getTotal_points(),content));
			       cells[6].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[7] = new PdfPCell(new Paragraph(gradeReport.getRanking(),content));
			       cells[7].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[8] = new PdfPCell(new Paragraph(gradeReport.getPromote(),content));
			       cells[8].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       listRow.add(row);
		       }
		      //把表格添加到文件中
		       document.add(table);
		       //关闭文档
		      document.close();
		       //关闭书写器
		      writer.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
      return true;
    }
    
    private boolean createRankingPdfReport(List<RankingReport> rankingReports) throws IOException {
    	if(rankingReports.size()<=0)
    		return false;
    	//创建文件
        Document document = new Document();
        int length = 3 + rankingReports.get(0).getStage_name().size();
		try { 
			  BaseFont baseFont = BaseFont.createFont("STSONG.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);//创建一个支持中文的字体
			  Font title = new Font(baseFont, 16, Font.NORMAL);
			  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("table.pdf"));
			  //打开文件
		       document.open();
		       Paragraph paragraph = new Paragraph(rankingReports.get(0).getReport_name(),title);
		       paragraph.setAlignment(Element.ALIGN_CENTER);
		       document.add(paragraph);
		    
		       PdfPTable table = new PdfPTable(length); 
		       table.setWidthPercentage(100); // 宽度100%填充
		       table.setSpacingBefore(10f); // 前间距
		       table.setSpacingAfter(10f); // 后间距

		       List<PdfPRow> listRow = table.getRows();
		       int i = 2;
		       //设置列宽
		       float[] columnWidths = new float[length];
		       columnWidths[0] = 1f;
		       columnWidths[1] = 1f;
		       for(int j = 0; j< length-3;j++)
		    	   columnWidths[i++] = 1f;
		       columnWidths[i] = 1f;
		       table.setWidths(columnWidths);
		       
		       PdfPCell cells1[]= new PdfPCell[length];
		       PdfPRow row1 = new PdfPRow(cells1);
		       Font tabletitle = new Font(baseFont, 11, Font.BOLD);
		       //单元格
		       cells1[0] = new PdfPCell(new Paragraph("报项名",tabletitle));//单元格内容
		       cells1[0].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       cells1[1] = new PdfPCell(new Paragraph("代表团",tabletitle));
		       cells1[1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       i = 2;
		       for(String stage_name : rankingReports.get(0).getStage_name()) {
		    	   cells1[i++] = new PdfPCell(new Paragraph(stage_name,tabletitle));
			       cells1[i-1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       }
		       cells1[i] = new PdfPCell(new Paragraph("名次",tabletitle));
		       cells1[i].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
		       listRow.add(row1);    
		       
		       Font content = new Font(baseFont, 11, Font.NORMAL);
		       for(RankingReport rankingReport:rankingReports) {
			       PdfPCell cells[]= new PdfPCell[length];
			       PdfPRow row = new PdfPRow(cells);
			       cells[0] = new PdfPCell(new Paragraph(rankingReport.getApply_name(),content));
			       cells[0].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       cells[1] = new PdfPCell(new Paragraph(rankingReport.getDelegation_name(),content));
			       cells[1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       i = 2;
			       for(String stage_grade : rankingReport.getStage_grade()) {
			    	   cells[i++] = new PdfPCell(new Paragraph(stage_grade,content));
				       cells[i-1].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       }
			       cells[i] = new PdfPCell(new Paragraph(rankingReport.getRanking(),content));
			       cells[i].setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
			       listRow.add(row);
		       }
		      //把表格添加到文件中
		       document.add(table);
		       //关闭文档
		      document.close();
		       //关闭书写器
		      writer.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
        return true;
    }
}