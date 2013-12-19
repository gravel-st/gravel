package st.gravel.tools;

import java.io.IOException;
import java.lang.invoke.MethodHandle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import st.gravel.support.jvm.runtime.MethodTools;

public class JettyToStHttpServletConverter extends HttpServlet
{
	private MethodHandle doGet_response_;
	private MethodHandle doPost_response_;

	public JettyToStHttpServletConverter(Object stServlet) {
		super();
		this.stServlet = stServlet;
		this.doGet_response_ = MethodTools.getHandle(stServlet, "doGet:response:");
		this.doPost_response_ = MethodTools.getHandle(stServlet, "doPost:response:");
	}

	private static final long serialVersionUID = 1L;
	
	private final Object stServlet;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	try {
			doGet_response_.invoke(stServlet, request, response);
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	try {
    		doPost_response_.invoke(stServlet, request, response);
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
    }
}