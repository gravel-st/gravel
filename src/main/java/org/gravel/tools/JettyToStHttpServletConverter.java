package org.gravel.tools;

import java.io.IOException;
import java.lang.invoke.MethodHandle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gravel.support.jvm.runtime.MethodTools;

public class JettyToStHttpServletConverter extends HttpServlet
{
	public JettyToStHttpServletConverter(Object stServlet) {
		super();
		this.stServlet = stServlet;
	}

	private static final long serialVersionUID = 1L;
	
	private final Object stServlet;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	try {
    		MethodTools.perform(stServlet, "doGet:response:", request, response);
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	try {
    		MethodTools.perform(stServlet, "doPost:response:", request, response);
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
    }
}