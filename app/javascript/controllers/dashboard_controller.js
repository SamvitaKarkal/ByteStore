import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from 'chart.js'

Chart.register(...registerables)

// Connects to data-controller="dashboard"
export default class extends Controller {
  static values = { revenue: String }

  connect() {
    console.log("Dashboard controller connected")
    this.initializeChart()
  }

  initializeChart() {
    try {
      const revenueData = JSON.parse(this.revenueValue)
      console.log("Revenue Data:", revenueData)

      const data = revenueData.map((item) => item[1] / 100.0)
      const labels = revenueData.map((item) => item[0])

      const canvas = document.getElementById('revenueChart')
      console.log("Canvas Element:", canvas)

      if (!canvas) {
        console.error("Canvas element not found")
        return
      }

      const ctx = canvas.getContext('2d')
      console.log("Canvas Context:", ctx)

      if (!ctx) {
        console.error("Failed to get context from canvas element")
        return
      }

      new Chart(ctx, {
        type: 'line',
        data: {
          labels: labels,
          datasets: [{
            label: 'Revenue $',
            data: data,
            borderWidth: 3,
            fill: true
          }]
        },
        options: {
          plugins: {
            legend: {
              display: false
            }
          },
          scales: {
            x: {
              grid: {
                display: false
              }
            },
            y: {
              border: {
                dash: [5, 5]
              },
              grid: {
                color: "#d4f3ef"
              },
              beginAtZero: true
            }
          }
        }
      })
    } catch (error) {
      console.error("Error initializing chart:", error)
    }
  }
}
