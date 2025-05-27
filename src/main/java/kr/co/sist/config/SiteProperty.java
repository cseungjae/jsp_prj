package kr.co.sist.config;

public class SiteProperty {
    private static SitePropertyVO sVO = SitePropertyVO.getInstance();

    private SiteProperty() {}

    public static final String SITE_NAME = sVO.getSite_name();
    public static final String SITE_VARSION = sVO.getSITE_VARSION();
    public static final String SITE_INFO = sVO.getSITE_INFO();
    public static final String PROTOCOL = sVO.getPROTOCOL(); // e.g. http://
    public static final String SERVER_NAME = sVO.getSERVER_NAME(); // e.g. localhost
    public static final String SERVER_PORT = sVO.getSERVER_PORT(); // e.g. 8080
    public static final String SERVLET_PATH = sVO.getSERVLET_PATH(); // e.g. /jsp_prj
    public static final String LOGO_IMG = sVO.getLOGO_IMG();
    public static final String UPLOAD_PATH = sVO.getUPLOAD_PATH();

    // ✅ 조합된 URL 문자열
    public static final String BASE_URL = PROTOCOL + SERVER_NAME + SERVER_PORT + SERVLET_PATH;
}
