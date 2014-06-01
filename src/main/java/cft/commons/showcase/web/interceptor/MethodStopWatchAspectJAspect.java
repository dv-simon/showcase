package cft.commons.showcase.web.interceptor;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.perf4j.StopWatch;
import org.perf4j.slf4j.Slf4JStopWatch;
import org.springframework.stereotype.Component;

/**
 * @author daniel
 *
 */
@Aspect
@Component
public class MethodStopWatchAspectJAspect {


	@Pointcut("execution(* cft.commons.showcase.service.impl.*.*(..))")
	public void methodStopWatchPointcut() {
	}

	@Around("methodStopWatchPointcut()")
	public Object methodStopWatch(ProceedingJoinPoint pjp) throws Throwable {
		
		String methodName = "methodlog:"+pjp.getSignature().getDeclaringType().getSimpleName()+":"+ pjp.getSignature().getName();
		
		StopWatch stopWatch = new Slf4JStopWatch(methodName);
		try {
			return pjp.proceed();
		} finally {
			stopWatch.stop();
		}
	}
	
	
	/*	@Pointcut("within(@org.springframework.stereotype.Controller *)")
	public void controllerBean() {
	}*/

	/*	@Around("controllerBean()")
	public Object apiPointCut(ProceedingJoinPoint pjp) throws Throwable {	return null;}*/

}
