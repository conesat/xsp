package com.hg.xsp.tools;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class XmlTool {
	/**
     * ����xml����
     */
    public static void createXml(){
        try {
            // ��������������          
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = factory.newDocumentBuilder();
            Document document = db.newDocument();
            // ����ʾstandalone="no"
            document.setXmlStandalone(true);
            Element bookstore = document.createElement("bookstore");
            // ��bookstore���ڵ�������ӽڵ�book
            Element book = document.createElement("book");

            Element name = document.createElement("name");
            // ����ʾ���� name.setNodeValue("����ʹ");
            name.setTextContent("����");
            book.appendChild(name);
            // Ϊbook�ڵ��������
            book.setAttribute("id", "1");
            // ��book�ڵ���ӵ�bookstore���ڵ���
            bookstore.appendChild(book);
            // ��bookstore�ڵ㣨�Ѱ���book����ӵ�dom����
            document.appendChild(bookstore);

            // ����TransformerFactory����
            TransformerFactory tff = TransformerFactory.newInstance();
            // ���� Transformer����
            Transformer tf = tff.newTransformer();

            // ��������Ƿ�ʹ�û���
            tf.setOutputProperty(OutputKeys.INDENT, "yes");
            // ����xml�ļ���д������
            tf.transform(new DOMSource(document), new StreamResult(new File("book1.xml")));
            System.out.println("����book1.xml�ɹ�");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("����book1.xmlʧ��");
        }       
    }
}
