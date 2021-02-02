package org.mtc.hr.utils;

import org.mtc.hr.model.Hr;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @Description: TODO
 * @author: Devin Liu
 * @时间 2019-10-24 8:11
 */
public class HrUtils {
    public static Hr getCurrentHr() {
        return ((Hr) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
    }
}
