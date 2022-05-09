package com.ruoyi.framework.config;

import net.hasor.core.ApiBinder;
import net.hasor.core.DimModule;
import net.hasor.core.TypeSupplier;
import net.hasor.db.JdbcModule;
import net.hasor.db.Level;
import net.hasor.spring.SpringModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;


@DimModule
@Component
public class HasorModule implements SpringModule {

    @Autowired
    private DataSource dataSource;

    @Override
    public void loadModule(ApiBinder apiBinder) throws Throwable {
        final TypeSupplier springTypeSupplier = springTypeSupplier(apiBinder);
        apiBinder.installModule(new JdbcModule(Level.Full, this.dataSource));
    }
}
