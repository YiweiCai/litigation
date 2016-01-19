package com.lawsuit.wsla.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.lawsuit.wsla.entity.UploadVideo;
import com.lawsuit.wsla.service.UploadVideService;

@Service
@Transactional
public class UploadVideoServiceImpl extends BaseServiceImpl<UploadVideo>
		implements UploadVideService {

}
