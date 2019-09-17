package test.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/post/private")
public class PrivateFilter implements Filter{

	@Override
	public void destroy() { }

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
			
			HttpServletRequest request = (HttpServletRequest)req;
			String id = (String) request.getSession().getAttribute("id");
			
			if(id!=null)
				chain.doFilter(req, res); //	다른 필터로 진행
			else{//	id가 null이라면
				
				//원래 가려던 url 정보 읽어오기 
				String url=request.getRequestURI();
				//GET 방식 전송 파라미터를 query string 으로 얻어오기
				String query=request.getQueryString();
				
				String encodedUrl=null;
				if(query==null) {//전달된 파라미터가 없다면 
					encodedUrl=URLEncoder.encode(url, java.nio.charset.StandardCharsets.UTF_8.toString());
				}else {
					encodedUrl=URLEncoder.encode(url+"?"+query, java.nio.charset.StandardCharsets.UTF_8.toString());
				}
				
				String cPath = request.getContextPath();
				((HttpServletResponse)res).sendRedirect(cPath+"/users/loginform.jsp?url="+encodedUrl);
			}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException { }

}
