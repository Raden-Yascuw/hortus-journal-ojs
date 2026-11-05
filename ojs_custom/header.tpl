{**
 * lib/pkp/templates/frontend/components/header.tpl
 * Green Academic Pro OJS Frontend Header (inspired by inspo journal.png)
 *}
{strip}
	{assign var="showingLogo" value=true}
	{if !$displayPageHeaderLogo}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

	<div class="pkp_structure_page">

		{* Header *}
		<header class="pkp_structure_head" id="headerNavigationContainer" role="banner">
			{include file="frontend/components/skipLinks.tpl"}

			{* Top Emerald Green Utility Bar (Register | Login) *}
			<div class="hj_topbar_gradient">
				<div class="hj_topbar_inner">
					<div class="pkp_navigation_user_wrapper" id="navigationUserWrapper">
						{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
					</div>
				</div>
			</div>

			{* White Main Navigation Row (Logo + Nav Links + Search Button) *}
			<div class="hj_navbar_white">
				<div class="pkp_head_wrapper hj_head_flex">

					<div class="pkp_site_name_wrapper">
						<button class="pkp_site_nav_toggle">
							<span>Open Menu</span>
						</button>
						{if !$requestedPage || $requestedPage === 'index'}
							<h1 class="pkp_screen_reader">
								{if $currentContext}
									{$displayPageHeaderTitle|escape}
								{else}
									{$siteTitle|escape}
								{/if}
							</h1>
						{/if}
						<div class="pkp_site_name">
						{capture assign="homeUrl"}
							{url page="index" router=$smarty.const.ROUTE_PAGE}
						{/capture}
						{if $displayPageHeaderLogo}
							<a href="{$homeUrl}" class="is_img">
								<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="290" height="54" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} />
							</a>
						{elseif $displayPageHeaderTitle}
							<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle|escape}</a>
						{else}
							<a href="{$homeUrl}" class="is_img">
								<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
							</a>
						{/if}
						</div>
					</div>

					{capture assign="primaryMenu"}
						{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
					{/capture}

					<nav class="pkp_site_nav_menu hj_nav_inline" aria-label="{translate|escape key="common.navigation.site"}">
						<a id="siteNav"></a>
						<div class="pkp_navigation_primary_row">
							<div class="pkp_navigation_primary_wrapper hj_primary_flex">
								<a href="{$homeUrl}" class="hj_home_nav_link"><span class="fa fa-home" aria-hidden="true"></span> Home</a>
								{$primaryMenu}
							</div>
						</div>
					</nav>

					{if $currentContext && $requestedPage !== 'search'}
						<div class="pkp_navigation_search_wrapper hj_search_box">
							<a href="{url page="search"}" class="pkp_search pkp_search_desktop hj_search_btn">
								<span class="fa fa-search" aria-hidden="true"></span>
								<span>SEARCH</span>
							</a>
						</div>
					{/if}
				</div><!-- .pkp_head_wrapper -->
			</div><!-- .hj_navbar_white -->
		</header><!-- .pkp_structure_head -->

		{* Full-width Hero Banner ("About Journal" with diagonal green geometric ribbons) *}
		{if !$requestedPage || $requestedPage === 'index'}
		<div class="hj_hero_banner" style="background-image: url('{$publicFilesDir}/hero_banner_bg.png');">
			<div class="hj_hero_container">
				<div class="hj_hero_overlay_box">
					<h2 class="hj_hero_title">About Journal</h2>
					<p class="hj_hero_text">
						The <strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong>, hosted by Departemen Agrosains &amp; UPT Perpustakaan Universitas Negeri Malang, is a dynamic Diamond Open Access platform dedicated to exploring sustainable tropical plantation crops, precision farming (IoT &amp; UAV multispectral sensing), and circular agro-industrial sciences. Our journal provides a space for researchers, agronomists, engineers, and practitioners to share valuable insights, evidence-based practices, and innovative strategies that shape sustainable agro-ecosystems.
					</p>
				</div>
			</div>
		</div>
		{/if}

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasSidebar value=0}
		{/if}
		<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
			<div class="pkp_structure_main" role="main">
				<a id="pkp_content_main"></a>
