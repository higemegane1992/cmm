# frozen_string_literal: true

# Logs controller class
class LogsController < ApplicationController
  add_breadcrumb 'ロギングデータ', :logs_path

  def index
    @machines = Machine.all
  end

  def show
    @machine = Machine.find(params[:id])
    add_breadcrumb "#{@machine.name}号機"

    @logs = Log.where(
      machine_id: params[:id],
      created_at: Time.zone.parse(params[:date]).beginning_of_day..Time.zone.parse(params[:date]).end_of_day
    )
    condition = Condition.find_by(machine_id: params[:id], mold_id: @logs[0].mold.id)

    lis_data = []
    lis_s_data = []
    lis_u_data = []
    lis_l_data = []
    his_data = []
    his_s_data = []
    his_u_data = []
    his_l_data = []
    sup_data = []
    sup_s_data = []
    sup_u_data = []
    sup_l_data = []
    cp_data = []
    cp_s_data = []
    cp_u_data = []
    cp_l_data = []
    bt_data = []
    bt_s_data = []
    bt_u_data = []
    bt_l_data = []
    ssp_data = []
    ssp_s_data = []
    ssp_u_data = []
    ssp_l_data = []
    dev_data = []
    dev_s_data = []
    dev_u_data = []
    dev_l_data = []
    fmf_data = []
    fmf_s_data = []
    fmf_u_data = []
    fmf_l_data = []
    mmf_data = []
    mmf_s_data = []
    mmf_u_data = []
    mmf_l_data = []
    
    @logs.each do |log|
      lis_data.push([log.created_at, log.lis])
      lis_s_data.push([log.created_at, condition.lis])
      lis_u_data.push([log.created_at, condition.lis_u])
      lis_l_data.push([log.created_at, condition.lis_l])
      his_data.push([log.created_at, log.his])
      his_s_data.push([log.created_at, condition.his])
      his_u_data.push([log.created_at, condition.his_u])
      his_l_data.push([log.created_at, condition.his_l])
      sup_data.push([log.created_at, log.sup])
      sup_s_data.push([log.created_at, condition.sup])
      sup_u_data.push([log.created_at, condition.sup_u])
      sup_l_data.push([log.created_at, condition.sup_l])
      cp_data.push([log.created_at, log.cp])
      cp_s_data.push([log.created_at, condition.cp])
      cp_u_data.push([log.created_at, condition.cp_u])
      cp_l_data.push([log.created_at, condition.cp_l])
      bt_data.push([log.created_at, log.bt])
      bt_s_data.push([log.created_at, condition.bt])
      bt_u_data.push([log.created_at, condition.bt_u])
      bt_l_data.push([log.created_at, condition.bt_l])
      ssp_data.push([log.created_at, log.ssp])
      ssp_s_data.push([log.created_at, condition.ssp])
      ssp_u_data.push([log.created_at, condition.ssp_u])
      ssp_l_data.push([log.created_at, condition.ssp_l])
      dev_data.push([log.created_at, log.dev])
      dev_s_data.push([log.created_at, condition.dev])
      dev_u_data.push([log.created_at, condition.dev_u])
      dev_l_data.push([log.created_at, condition.dev_l])
      fmf_data.push([log.created_at, log.fmf])
      fmf_s_data.push([log.created_at, condition.fmf])
      fmf_u_data.push([log.created_at, condition.fmf_u])
      fmf_l_data.push([log.created_at, condition.fmf_l])
      mmf_data.push([log.created_at, log.mmf])
      mmf_s_data.push([log.created_at, condition.mmf])
      mmf_u_data.push([log.created_at, condition.mmf_u])
      mmf_l_data.push([log.created_at, condition.mmf_l])
    end

    @lis = [
      {
        name: "ロギングデータ",
        data: lis_data,
        points: false
      },
      {
        name: "設定値",
        data: lis_s_data,
        points: false
      },
      {
        name: "上限値",
        data: lis_u_data,
        points: false
      },
      {
        name: "下限値",
        data: lis_l_data,
        points: false
      }
    ]
    @his = [
      {
        name: "ロギングデータ",
        data: his_data,
        points: false
      },
      {
        name: "設定値",
        data: his_s_data,
        points: false
      },
      {
        name: "上限値",
        data: his_u_data,
        points: false
      },
      {
        name: "下限値",
        data: his_l_data,
        points: false
      }
    ]
    @sup = [
      {
        name: "ロギングデータ",
        data: sup_data,
        points: false
      },
      {
        name: "設定値",
        data: sup_s_data,
        points: false
      },
      {
        name: "上限値",
        data: sup_u_data,
        points: false
      },
      {
        name: "下限値",
        data: sup_l_data,
        points: false
      }
    ]
    @bt = [
      {
        name: "ロギングデータ",
        data: bt_data,
        points: false
      },
      {
        name: "設定値",
        data: bt_s_data,
        points: false
      },
      {
        name: "上限値",
        data: bt_u_data,
        points: false
      },
      {
        name: "下限値",
        data: bt_l_data,
        points: false
      }
    ]
    @cp = [
      {
        name: "ロギングデータ",
        data: cp_data,
        points: false
      },
      {
        name: "設定値",
        data: cp_s_data,
        points: false
      },
      {
        name: "上限値",
        data: cp_u_data,
        points: false
      },
      {
        name: "下限値",
        data: cp_l_data,
        points: false
      }
    ]
    @ssp = [
      {
        name: "ロギングデータ",
        data: ssp_data,
        points: false
      },
      {
        name: "設定値",
        data: ssp_s_data,
        points: false
      },
      {
        name: "上限値",
        data: ssp_u_data,
        points: false
      },
      {
        name: "下限値",
        data: ssp_l_data,
        points: false
      }
    ]
    @dev = [
      {
        name: "ロギングデータ",
        data: dev_data,
        points: false
      },
      {
        name: "設定値",
        data: dev_s_data,
        points: false
      },
      {
        name: "上限値",
        data: dev_u_data,
        points: false
      },
      {
        name: "下限値",
        data: dev_l_data,
        points: false
      }
    ]
    @fmf = [
      {
        name: "ロギングデータ",
        data: fmf_data,
        points: false
      },
      {
        name: "設定値",
        data: fmf_s_data,
        points: false
      },
      {
        name: "上限値",
        data: fmf_u_data,
        points: false
      },
      {
        name: "下限値",
        data: fmf_l_data,
        points: false
      }
    ]
    @mmf = [
      {
        name: "ロギングデータ",
        data: mmf_data,
        points: false
      },
      {
        name: "設定値",
        data: mmf_s_data,
        points: false
      },
      {
        name: "上限値",
        data: mmf_u_data,
        points: false
      },
      {
        name: "下限値",
        data: mmf_l_data,
        points: false
      }
    ]
  end
end
