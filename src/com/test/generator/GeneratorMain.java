package com.test.generator;

import cn.org.rapid_framework.generator.GeneratorFacade;
import cn.org.rapid_framework.generator.GeneratorProperties;


/**
 * 
 * @author badqiu
 * @email badqiu(a)gmail.com
 */

public class GeneratorMain {
	/**
	 * 请直接修改以下代码调用不同的方法以执行相关生成任务.
	 */
	public static void main(String[] args) throws Exception {
		
		GeneratorFacade g = new GeneratorFacade();
		
//		g.printAllTableNames();				//打印数据库中的表名称
		
		
	//	g.deleteOutRootDir();							//删除生成器的输出目录
//		g.generateByTable("TM_SYS_ACTDICT","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_COLLECTION_ALLOT","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_DICT","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_LITISTATE","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_MENU","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_ORGANIZATION","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_OUTSOURCING_ALLOT","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_OUTSOURCING_COMPANY","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_ROLE","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_USER","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_ROLE_MENU","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_USER_ROLE","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_VIRTUAL_GROUP","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_LAWFIRM","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_LITIGATION_ALLOT","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_LOGIN_LOG","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_SYS_MSGS_TEMPLATE","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("TM_CS_HIS_COLLECT_INFO","template");	//通过数据库表生成文件,template为模板的根目录
////	
////		
//		g.generateByTable("TM_CS_ACTION_PATH","template");
//		g.generateByTable("TM_CS_ACTION_REC","template");
//		g.generateByTable("TM_CS_ALLOT_REC","template");
//		g.generateByTable("TM_CS_BULLETIN_REC","template");
//		g.generateByTable("TM_CS_CASE_CONTACT","template");
//		g.generateByTable("TM_CS_CASE_MAIN","template");
//		g.generateByTable("TM_CS_CASE_OUTSRC","template");
//		g.generateByTable("TM_CS_CASE_PTP","template");
//		g.generateByTable("TM_CS_COLLECTION_REC","template");
//		g.generateByTable("TM_CS_FLAG_MODIFY_REC","template");
//		g.generateByTable("TM_CS_LAWSUIT_EXPENSE_REC","template");
//		g.generateByTable("TM_CS_LAWSUIT_STAGE_REC","template");
//		g.generateByTable("TM_CS_NOTE_REC","template");
//		g.generateByTable("TM_CS_OUTSRC_REC","template");
//		g.generateByTable("TM_CS_PBC_REC","template");
//		g.generateByTable("TM_CS_POLICE_REC","template");
//		g.generateByTable("TM_CS_PTP_REC","template");
//		g.generateByTable("TM_CS_WRITE_OFF_REC","template");
		g.generateByTable("TM_COLL_QUEUE","template");
		g.generateByTable("TM_COLL_REC","template");
//		g.generateByTable("TM_BDP_ACCOUNT","template");
//		g.generateByTable("TM_BDP_CARD","template");
//		g.generateByTable("TM_BDP_CASE_EXT","template");
//		g.generateByTable("TM_BDP_CASE_MAIN","template");
//		g.generateByTable("TM_BDP_CUSTOMER","template");
//		g.generateByTable("TM_BDP_IM_INFO","template");
//		g.generateByTable("TM_BDP_LOAN","template");
//		g.generateByTable("TM_BDP_PLAN","template");
//		g.generateByTable("TM_BDP_STATUS","template");
//		g.generateByTable("TM_BDP_TXN_HST","template");
		
//		g.generateByAllTable("template");	//自动搜索数据库中的所有表并生成文件,template为模板的根目录
//		g.generateByClass(Blog.class,"template_clazz");
		 
//		g.deleteByTable("table_name", "template"); //删除生成的文件
		//打开文件夹
		Runtime.getRuntime().exec("cmd.exe /c start "+GeneratorProperties.getRequiredProperty("outRoot"));
	}
}
