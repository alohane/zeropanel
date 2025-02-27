<!DOCTYPE html>
<html lang="en">
    <head>
	<title>{$config["appName"]} Order Detail</title>
        
        <meta charset="UTF-8" />
        <meta name="renderer" content="webkit" />
        <meta name="description" content="Updates and statistics" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="format-detection" content="telephone=no,email=no" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="theme-color" content="#3B5598" />
        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
        <meta http-equiv="expires" content="0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
        <link href="/theme/zero/assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
        <link href="/theme/zero/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
        <link href="/theme/zero/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
        <link href="/favicon.png" rel="shortcut icon">
        <link href="/apple-touch-icon.png" rel="apple-touch-icon">
    </head>
    {include file ='include/index/menu.tpl'}
                    <div class="app-main flex-column flex-row-fluid" id="kt_app_main">
                        <div class="d-flex flex-column flex-column-fluid mt-10">
                            <div id="kt_app_content" class="app-content flex-column-fluid">
                                <div id="kt_app_content_container" class="app-container container-xxl">
                                    
                                    <div class="card card-flush py-4 flex-row-fluid overflow-hidden">
                                        
                                        <div class="card-header">
                                            <div class="card-title">
                                                <h2>{$trans->t('order')} #{$order->order_no}</h2>
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="card-body pt-0">
                                            <div class="table-responsive">
                                                
                                                <table class="table align-middle table-striped table-row-bordered gy-5 gs-7 mb-0">
                                                    
                                                    <thead>
                                                        <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                                            <th class="min-w-175px">{$trans->t('type')}</th>
                                                            <th class="min-w-70px text-end">{$trans->t('status')}</th>
															{if $order->order_status == '2'}
                                                                <th class="min-w-70px text-end">{$trans->t('payment method')}</th>
                                                            {/if}
                                                            <th class="min-w-100px text-end">{$trans->t('order number')}</th>
                                                            <th class="min-w-70px text-end">{$trans->t('quantity')}</th>
                                                            <th class="min-w-100px text-end">{$trans->t('price')}</th>
                                                            <th class="min-w-100px text-end">{$trans->t('total')}</th>
                                                        </tr>
                                                    </thead>
                                                    
                                                    
                                                    <tbody class="fw-semibold text-gray-600">
                                                        
                                                        <tr>
                                                            <td>
                                                                <div class="d-flex align-items-center">
                                                                    <div class="ms-5">
                                                                        <a class="fw-bold text-gray-600 text-hover-primary">{$order_type[$order->order_type]}</a>
                                                                        <div class="fs-7 text-muted">{$trans->t('date')}: {date('Y-m-d H:i:s', $order->created_time)}</div>
                                                                    </div>
                                                                    
                                                                </div>
                                                            </td>
                                                            
                                                            <td class="text-end">
                                                                {if $order->order_status == '1'}
                                                                <span class="badge badge-warning fs-6 fw-bold">{$trans->t('pending')}</span>
                                                                {else if $order->order_status == '2'}
                                                                <span class="badge badge-success fs-6 fw-bold">{$trans->t('paid')}</span>
																{else if $order->order_status == '0'}
																<span class="badge badge-danger fs-6 fw-bold">{$trans->t('invalid')}</span>	
                                                                {/if}   
                                                            </td>
															{if $order->order_status == '2'}
																<td class="text-end">{$trans->t($payment)}</td>
															{/if}
                                                            <td class="text-end">{$order->order_no}</td>                                                           
                                                            <td class="text-end">1</td>
                                                            <td class="text-end">{$order->order_total}</td>                                                           
                                                            <td class="text-end">{$order->order_total}</td>                                                           
                                                        </tr>                                                                                                              
                                                        <tr>
                                                            <td {if $order->order_status == '2'}colspan="6"{else}colspan="5"{/if} class="text-end">{$trans->t('subtotal')}</td>
                                                            <td class="text-end">{$order->order_total}</td>
                                                        </tr>
                                                        
                                                        
														{if !is_null($order->order_coupon)}
                                                        <tr>
                                                            <td {if $order->order_status == '2'}colspan="6"{else}colspan="5"{/if} class="text-end">{$trans->t('discount')}</td>
                                                            <td class="text-end">{$order->product_price - $order->order_total}</td>
                                                        </tr>
														{/if}
                                                        
                                                        
                                                        <tr>
                                                            <td {if $order->order_status == '2'}colspan="6"{else}colspan="5"{/if} class="fs-3 text-dark text-end">{$trans->t('total')}</td>
                                                            <td class="text-dark fs-3 fw-bolder text-end">{$order->order_total}</td>
                                                        </tr>
														
														{if $order->order_status == '2'}
														<tr>
                                                            <td colspan="6" class="fs-3 text-dark text-end">{$trans->t('paid')}</td>
                                                            <td class="text-dark fs-3 fw-bolder text-end">{$order->order_total}</td>
                                                        </tr>
														{/if}
                                                        
                                                    </tbody>
                                                    
                                                </table>
                                                
                                            </div>
											{if $order->order_status == '1'}
                                            <div class="col-lg-12">
												<label class="col-form-label kt-font-boldest"><strong>{$trans->t('payment method')}: </strong></label>
												
													<ul class="nav nav-pills d-flex flex-column flex-xl-row justify-content-center" role="tablist" id="payment_method">
													
														{if $payment_gateway['alipay_payment'] != 'none'}
														<li class="nav-item mb-3">
															<a class="btn btn-outline btn-active-light-primary d-flex flex-column active" data-bs-toggle="pill" data-name="alipay">
																<span class="nav-icon py-2 w-auto">
																	<i class="fab fa-alipay fs-3hx text-primary"></i>
																</span>
																<span class="text-primary fs-3 py-2 fw-bold">{$trans->t('alipay')}</span>
															</a>
														</li>
														{/if}
														{if $payment_gateway['wechatpay_payment'] != 'none'}
														<li class="nav-item mb-3">
															<a class="btn btn-outline btn-active-light-success d-flex flex-column" data-bs-toggle="pill" data-name="wechatpay">
																<span class="nav-icon py-2">
																	<i class="fab fa-weixin fs-3hx text-success"></i>
																</span>
																<span class="fs-3 py-2 fw-bold text-success">{$trans->t('wechat')}</span>
															</a>
														</li>
														{/if}
														{if $payment_gateway['cryptopay_payment'] != 'none'}
														<li class="nav-item mb-3">
															<a class="btn btn-outline btn-active-light-warning d-flex flex-column" data-bs-toggle="pill" data-name="cryptopay">
																<span class="nav-icon py-2">
																	<i class="fab fa-bitcoin fs-3hx text-warning"></i>
																</span>
																<span class="fs-3 py-2 fw-bold text-warning">{$trans->t('crypto')}</span>
															</a>
														</li>
														{/if}
													
														{if $order->order_type != 2}
														<li class="nav-item mb-3">
															<a class="btn btn-outline btn-active-light-info d-flex flex-column" data-bs-toggle="pill" data-name="creditpay">
																<span class="nav-icon py-2">
																	<i class="bi bi-wallet fs-3hx text-info"></i>
																</span>
																<span class="fs-3 py-2 fw-bold text-info">{$trans->t('credit')}</span>
															</a>
														</li>
														{/if}
													</ul>
											</div>
											<div class="text-center pt-15">
												<button class="btn btn-primary" type="submit" data-kt-users-action="submit" onclick="KTUsersPayOrder('{$order->order_no}')">
													<span class="indicator-label">{$trans->t('submit')}</span>
													<span class="indicator-progress">{$trans->t('please wait')}
													<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
												</button>
											</div>
											{/if}
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="app_footer py-4 d-flex flex-lg-column" id="kt_app_footer">
                            <div class="app-container container-fluid d-flex flex-column flex-md-row flex-center flex-md-stack py-3">
                                <div class="text-dark-75 order-2 order-md-1">
                                    &copy;<script>document.write(new Date().getFullYear());</script>,&nbsp;<a>{$config["appName"]},&nbsp;Inc.&nbsp;All rights reserved.</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		{include file='include/global/scripts.tpl'}
        {include file='include/index/news.tpl'}
    </body>
</html>