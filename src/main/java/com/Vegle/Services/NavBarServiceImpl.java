package com.Vegle.Services;

import com.Vegle.Bean.CmsNavBar;
import com.Vegle.Dao.NavBarDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NavBarServiceImpl implements NavBarService{
    @Autowired
    NavBarDao navBarDao;
    public List<CmsNavBar> getCmsNavBarTag() {

        return navBarDao.getCmsNavBarTag();
    }
}
