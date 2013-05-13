/**
 * 
 */
package ru.lsv.cruisecontrol.widgets;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import net.sourceforge.cruisecontrol.dashboard.widgets.Widget;

import org.junit.Test;

/**
 * Тест для MergedFindBugsWidget
 * 
 * @author s.lezhnev
 * 
 */
public class MergedFindBugsWidgetTest {

    private MergedFindBugsWidget widget = new MergedFindBugsWidget();

    /**
     * Test method for
     * {@link ru.lsv.cruisecontrol.widgets.MergedJacocoWidget#getOutput(java.util.Map)}
     * .
     */
    @Test
    public final void testGetOutput() {
        Map map = new HashMap();
        map.put(Widget.PARAM_BUILD_LOG_FILE, new File("modules_fingbugs.xml"));
        System.out.println(widget.getOutput(map));
    }

    /**
     * Test method for
     * {@link ru.lsv.cruisecontrol.widgets.MergedJacocoWidget#getDisplayName()}.
     */
    @Test
    public final void testGetDisplayName() {
        "Merged FindBugs".equals(widget.getDisplayName());
    }
}
