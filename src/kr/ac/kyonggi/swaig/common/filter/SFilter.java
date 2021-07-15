package kr.ac.kyonggi.swaig.common.filter;

import com.google.gson.Gson;
import kr.ac.kyonggi.swaig.handler.dao.settings.HomeDAO;
import kr.ac.kyonggi.swaig.handler.dao.user.UserDAO;
import kr.ac.kyonggi.swaig.handler.dto.user.UserDTO;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class SFilter implements Filter {

    /**
     * 모든 url이 요청될 때 가장 처음으로 실행되는 클래스.
     * 이 클래스가 없으면 UTF-8이 설정되지 않아 한글이 전부 깨짐.
     * 비로그인자에 대한 일부 설정을 돕기도 함.
     * Taglib에서 사용 할 공통 설정을 담당하기도 함.
     * */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException { }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)   throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(true);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("P3P","CP='CAO PSA CONI OTR OUR DEM ONL'");


        if(session.getAttribute("type") == null) {
            /**
             * type이 null인 경우 오류를 방지하기 위해 default 값으로 기타로 지정함.
             * (일부 페이지에서는 JS로 type을 요구하는데, null인 경우 오류가 발생하는 것을 방지
             * */
            Gson gson = new Gson();
            session.setAttribute("type", gson.toJson(UserDAO.getInstance().getType("기타")));
//            session.setAttribute("headermenulist", gson.toJson(HomeDAO.getInstance().getHeaderMenu()));
//            session.setAttribute("menulist", gson.toJson(HomeDAO.getInstance().getMenu()));
//            response.sendRedirect("Index");
//            return;
        }

        chain.doFilter(request, response);


    }

    @Override
    public void destroy() { }
}
