package pruebas;

import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.core.IsNot.not;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Alert;
import org.openqa.selenium.Keys;
import java.util.*;
import java.net.MalformedURLException;
import java.net.URL;
public class InactivateCuentaTest {
  private WebDriver driver;
  private Map<String, Object> vars;
  JavascriptExecutor js;
  @Before
public void setUp() {
    driver = new ChromeDriver();
    js = (JavascriptExecutor) driver;
    vars = new HashMap<String, Object>();
  }
  @After
public void tearDown() {
    driver.quit();
  }
  @Test
  public void inactivateCuenta() {
	  
	  driver.get("https://estrellaroja.taleo.net/smartorg/iam/accessmanagement/login.jsf?redirectionURI=https%3A%2F%2Festrellaroja.taleo.net%2Fsmartorg%2Fsmartorg%2Fcommon%2Ftoc.jsf%3Flang%3Den&TARGET=https%3A%2F%2Festrellaroja.taleo.net%2Fsmartorg%2Fsmartorg%2Fcommon%2Ftoc.jsf%3Flang%3Den");
	    driver.manage().window().setSize(new Dimension(922, 1080));
	    driver.findElement(By.id("dialogTemplate-dialogForm-content-login-name1")).sendKeys("gflores");
	    driver.findElement(By.id("dialogTemplate-dialogForm-content-login-password")).click();
	    driver.findElement(By.id("dialogTemplate-dialogForm-content-login-password")).sendKeys("A12345678");
	    driver.findElement(By.cssSelector(".nav-btn5")).click();
	  
	  
    driver.get("https://estrellaroja.taleo.net/smartorg/smartorg/admin/smartOrgAdmin.jsf");
    driver.manage().window().setSize(new Dimension(920, 1080));
    driver.findElement(By.id("menuTemplate-menuForm-content-outputText_usersManagement")).click();
    driver.findElement(By.cssSelector(".list-evenrows:nth-child(1) > .list-column:nth-child(1)")).click();
    driver.findElement(By.id("list-list-content-userList-list-0-userViewCommandLink")).click();
    driver.findElement(By.cssSelector("#viewTemplate-viewForm-content-userViewContent-userInfoContent-userAccountInformation-deactivateAccount .action-btn5")).click();
    driver.findElement(By.cssSelector("#dialogTemplate-dialogForm-content-deactivateAccount .nav-btn5")).click();
  }
}
