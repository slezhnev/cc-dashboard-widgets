package ru.lsv.cruisecontrol.widgets;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;
import java.util.Scanner;

import net.sourceforge.cruisecontrol.dashboard.widgets.Widget;

/**
 * Виджет для dashboard CruiseControl 2.8 для отображения названий тестов,
 * выполняемых на эмуляторе, которые вызывают падение тестируемого приложения
 * 
 * @author s.lezhnev
 */
public class MergedAndroidTestsErrorsWidget implements Widget {

    /*
     * (non-Javadoc)
     * 
     * @see
     * net.sourceforge.cruisecontrol.dashboard.widgets.Widget#getOutput(java
     * .util.Map)
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Object getOutput(final Map parameters) {
        final File logFile = (File) parameters.get(Widget.PARAM_BUILD_LOG_FILE);
        try {
            return findFailedTests(logFile);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Пытается найти упавший тест и выдать его имя
     * 
     * @param logFile
     *            Build log
     * @return "" или название теста, который крэшнулся (с причиной креша)
     */
    private Object findFailedTests(File logFile) {
        StringBuffer res =
                new StringBuffer(
                        "<style>.aft{font-family:arial,helvetica,sans-serif;font-size:10pt;color:#000000;}</style><div class=\"aft\">");
        Scanner in = null;
        try {
            in = new Scanner(new FileReader(logFile));
            while (in.hasNextLine()) {
                String tmp = in.nextLine();
                if (tmp.indexOf("INSTRUMENTATION_RESULT") >= 0) {
                    // Тут оишбка - выдаем...
                    final String shortMsg = "shortMsg=";
                    final String cdata = "<![CDATA[";
                    int posCDATA = tmp.indexOf(cdata) + cdata.length();
                    int posShortMsg = tmp.indexOf(shortMsg) + shortMsg.length();
                    res.append(
                            tmp.substring(posCDATA, tmp.indexOf(":", posCDATA)))
                            .append(" (").append(
                                    tmp.substring(posShortMsg, tmp.indexOf(
                                            "]]", posShortMsg))).append(")");

                    break;
                }
            }
            res.append("</div>");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (Exception e) { /* ignore */
            }
        }
        return res.toString();
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * net.sourceforge.cruisecontrol.dashboard.widgets.Widget#getDisplayName()
     */
    @Override
    public String getDisplayName() {
        return "Failed Android Test";
    }

}
