/**
 * Виджет для dashboard CruiseControl 2.8 для отображения результатов
 * работы FindBugs (http://findbugs.sourceforge.net/)
 */
package ru.lsv.cruisecontrol.widgets;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.Map;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import net.sourceforge.cruisecontrol.dashboard.widgets.Widget;

/**
 * Виджет для dashboard CruiseControl 2.8 для отображения результатов работы
 * FindBugs (http://findbugs.sourceforge.net/)
 * 
 * @author s.lezhnev
 */
public class MergedFindBugsWidget implements Widget {

    /*
     * (non-Javadoc)
     * 
     * @see
     * net.sourceforge.cruisecontrol.dashboard.widgets.Widget#getOutput(java
     * .util.Map)
     */
    @Override
    public Object getOutput(final Map parameters) {
        final File logFile = (File) parameters.get(Widget.PARAM_BUILD_LOG_FILE);
        try {
            return transformJacoco(logFile);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Выполняет xslt transform над лог-файлом
     * 
     * @param logFile
     *            Build log
     * @return
     */
    private Object transformJacoco(File logFile) {
        TransformerFactory tFactory = TransformerFactory.newInstance();
        try {
            InputStream xls = this.getClass().getResourceAsStream(
                    "/ru/lsv/cruisecontrol/widgets/findbugs.xsl");
            Transformer transformer = tFactory.newTransformer(new StreamSource(
                    xls));
            StreamSource xmlSource = new StreamSource(new FileInputStream(
                    logFile));
            StringWriter out = new StringWriter();
            transformer.transform(xmlSource, new StreamResult(out));
            return out.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * net.sourceforge.cruisecontrol.dashboard.widgets.Widget#getDisplayName()
     */
    @Override
    public String getDisplayName() {
        return "Merged FindBugs";
    }

}
