// 1. Param.java (JavaBean 클래스)
package day0508;

public class Param {
    private String txt;
    private String pass;
    private String file;
    private String hid;
    private String flag;
    private String sel;
    private String ta;
    private String[] lang;

    public Param() {
        // 기본 생성자
    }

    // Getter/Setter
    public String getTxt() { return txt; }
    public void setTxt(String txt) { this.txt = txt; }

    public String getPass() { return pass; }
    public void setPass(String pass) { this.pass = pass; }

    public String getFile() { return file; }
    public void setFile(String file) { this.file = file; }

    public String getHid() { return hid; }
    public void setHid(String hid) { this.hid = hid; }

    public String getFlag() { return flag; }
    public void setFlag(String flag) { this.flag = flag; }

    public String getSel() { return sel; }
    public void setSel(String sel) { this.sel = sel; }

    public String getTa() { return ta; }
    public void setTa(String ta) { this.ta = ta; }

    public String[] getLang() { return lang; }
    public void setLang(String[] lang) { this.lang = lang; }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[txt=").append(txt)
          .append(", pass=").append(pass)
          .append(", file=").append(file)
          .append(", hid=").append(hid)
          .append(", flag=").append(flag)
          .append(", sel=").append(sel)
          .append(", ta=").append(ta)
          .append(", lang=");
        if (lang != null) {
            for (String l : lang) {
                sb.append(l).append(" ");
            }
        }
        sb.append("]");
        return sb.toString();
    }
}
