package util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;


import jakarta.servlet.ServletContext;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRXlsExporter;

public class ReportUtil implements Serializable{
		
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("rawtypes")
	public byte[] geraRelatorioExcel(List listaDados, String nomeRelatorio, HashMap<String, Object> params, ServletContext servletContext) throws Exception {
		
		// Cria a lista de dados que vem da consulta SQL do banco de dados
		JRBeanCollectionDataSource jrBeanCollectionDataSource = new JRBeanCollectionDataSource(listaDados);
		
		String caminhoJasper = servletContext.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		@SuppressWarnings("unchecked")
		JasperPrint impressoraJasper = JasperFillManager.fillReport(caminhoJasper, params, jrBeanCollectionDataSource);
		
		JRExporter exporter = new JRXlsExporter(); // Excel
		
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, impressoraJasper);
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
		exporter.exportReport();
		
		return baos.toByteArray(); 
	}
	
	@SuppressWarnings("rawtypes")
	public byte[] geraRelatorioPDF(List listaDados, String nomeRelatorio, HashMap<String, Object> params, ServletContext servletContext) throws Exception {
		
		// Cria a lista de dados que vem da consulta SQL do banco de dados
		JRBeanCollectionDataSource jrBeanCollectionDataSource = new JRBeanCollectionDataSource(listaDados);
		
		String caminhoJasper = servletContext.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		@SuppressWarnings("unchecked")
		JasperPrint impressoraJasper = JasperFillManager.fillReport(caminhoJasper, params, jrBeanCollectionDataSource);
		
		return JasperExportManager.exportReportToPdf(impressoraJasper);
	}

	@SuppressWarnings("rawtypes")
	public byte[] geraRelatorioPDF(List listaDados, String nomeRelatorio, ServletContext servletContext) throws Exception {
		
		// Cria a lista de dados que vem da consulta SQL do banco de dados
		JRBeanCollectionDataSource jrBeanCollectionDataSource = new JRBeanCollectionDataSource(listaDados);
		
		String caminhoJasper = servletContext.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		@SuppressWarnings("unchecked")
		JasperPrint impressoraJasper = JasperFillManager.fillReport(caminhoJasper, new HashMap(), jrBeanCollectionDataSource);
		
		return JasperExportManager.exportReportToPdf(impressoraJasper);
	}

}
