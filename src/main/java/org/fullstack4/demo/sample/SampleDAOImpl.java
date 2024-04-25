package org.fullstack4.demo.sample;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



@Repository
@Qualifier("event")
public class SampleDAOImpl implements SampleDAO {

}
